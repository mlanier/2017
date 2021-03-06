
import tensorflow as tf
import pandas as pd
import numpy as np
from scipy.special import erf
import matplotlib as plt
from IPython.display import display





#X,y,data are all pandas dataframes
def NB(X,y,data,early_stopping_rounds=3,stopping_threshold=.00001,max_steps=1000):
    
    #Define variables and session
    X = pd.concat([pd.Series(np.ones(len(X))),X.reset_index(drop=True)], axis=1)
    y=Y.as_matrix()
    size=X.columns.shape[0]
    x=X.as_matrix().astype(np.float32)
    B=tf.Variable(tf.random_normal([size,1]))
    a = tf.Variable(tf.random_uniform([1]))
    L=y * tf.log(a)+y*(tf.matmul(x,B))-(y+1/a)*tf.log(1+tf.to_float(a)*tf.exp(tf.matmul(x,B)))+tf.lgamma(y+1/a)-tf.lgamma(1/a)                                                                                                   
    loss = tf.reduce_sum(-L)
    optimizer = tf.train.AdamOptimizer(learning_rate=0.1, beta1=0.9, beta2=0.999, epsilon=1e-08)
    train = optimizer.minimize(loss)
    init = tf.global_variables_initializer()
    sess = tf.Session(config=tf.ConfigProto(log_device_placement=True))
    sess.run(init)
    
    #Implement Early Stopping. If it doesn't imporove more than
    prior=100000000
    current=100
    n=1
    Flag=0
    #Open tensorflow session
    while( (max(abs(prior),abs(current))-min(abs(prior),abs(current)))/max(abs(prior),abs(current))>stopping_threshold and Flag<early_stopping_rounds):
        if((max(abs(prior),abs(current))-min(abs(prior),abs(current)))/max(abs(prior),abs(current))>stopping_threshold):
            Flag=0 #If the loss doesn't imporove by .001% three times in a row exit.
        prior=current
        sess.run(train)
        if(n==1):
            print("The value of the likelihood function at the MLE is the absolute value of ",sess.run(loss))
        else:
            print(sess.run(loss))
        current=sess.run(loss)        
        n=n+1
        if((max(abs(prior),abs(current))-min(abs(prior),abs(current)))/max(abs(prior),abs(current))<=stopping_threshold):
            Flag=Flag+1
        if(n>=max_steps):  #run a max of 1000 times
            break
    Beta=np.array(sess.run(B))
    alpha=np.array(sess.run(a))
    #Calculate and return AIC
    AIC=2*X.columns.shape[0]+1-2*sess.run(loss)
    
    #Find Hessian

    def replace_none_with_zero(l):
      return [0 if i==None else i for i in l] 

    tf.reset_default_graph()

    x = tf.Variable(tf.random_normal([1,size]))
    y = tf.Variable(tf.random_uniform([1]))
    loss = (y * tf.log(sess.run(a))+y*(tf.matmul(x,sess.run(B)))-(y+1/sess.run(a))*tf.log(1+tf.to_float(sess.run(a))*tf.exp(tf.matmul(x,sess.run(B))))+tf.lgamma(y+1/sess.run(a))-tf.lgamma(1/sess.run(a))) 
    grads = tf.gradients([loss], [x, y])
    hess0 = tf.gradients([grads[0]], [x])
    #hess0 = tf.hessians(tf.reshape(x, loss, name='hessians', colocate_gradients_with_ops=False, gate_gradients=False, aggregation_method=None)
    #Tensorflow doesn't support multi demensional gradient calculation 
    sess = tf.InteractiveSession()
    sess.run(tf.global_variables_initializer())
    var=np.array(sess.run(hess0))

    result = pd.Series(Beta.tolist())
    labels = ['$\\beta$']
    results = pd.DataFrame(result, columns=labels)
    results['St Err']=pd.Series(1/np.sqrt(abs(var.flatten())))
    results['Z']= results['$\\beta$']/results['St Err'][0]
    
    def phi(x):

        return (1.0 + erf(x / np.sqrt(2.0))) / 2.0

    results['$p$']=1-phi(results['Z'].astype(float))
    results['$\\alpha$']=pd.Series(alpha.tolist())
    results['AIC']=pd.Series(AIC.tolist())
    return(results)



if __name__ == "__main__":
    url = 'http://vincentarelbundock.github.com/Rdatasets/csv/COUNT/medpar.csv'
    data=pd.read_csv(url)
    X=data[['type2', 'type3','hmo','white']].astype(np.float64)
    Y=data[['los']].astype(np.float32)
    display(NB(X,Y,data))





#http://stackoverflow.com/questions/35266370/tensorflow-compute-hessian-matrix-and-higher-order-derivatives
#http://www.mathematica-journal.com/2013/06/negative-binomial-regression/





