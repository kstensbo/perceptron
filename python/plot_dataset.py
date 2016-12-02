import numpy as np
from sklearn.datasets import make_blobs, make_circles

import matplotlib.pyplot as plt

import seaborn as sns
seapal = sns.color_palette('Paired')
sns.set_style('ticks')

from IPython import embed

def f(x, w):
    if len(w) == 2:
        y = -w[0]/w[1] * np.array(x)
    else:
        y = -(w[1] * np.array(x) + w[0])/w[2]
    return y

if __name__ == "__main__":


    X, y = make_blobs(30, n_features=2, centers=2, cluster_std=2,
                      random_state=42
                      )
    #X, y = make_circles(100, noise=0.1, factor=0.4, random_state=42)

    w = [2.,-1.] # one solution!
    w = [2.0,8.6146,-4.270200000000001]

    w = np.array(w)
    w /= np.linalg.norm(w)

    y[y == 0] = -1

    fig, ax = plt.subplots()

    scolour = [seapal[1] if i==-1 else seapal[3] for i in y]
    ax.scatter(X[:,0], X[:,1], c=scolour, s=42,
               edgecolors=plt.cm.binary(0), alpha=0.8)


    axes = ax.axis()

    xw = ax.get_xlim()
    yw = f(xw, w)

    ax.plot(xw,yw, c=seapal[5])

    ax.axis(axes)

    ax.set_xlabel(r'$x_1$', fontsize=14)
    ax.set_ylabel(r'$x_2$', fontsize=14)

    plt.show()
    #plt.savefig("../figures/w11.png")
