import numpy as np
from sklearn.datasets import make_blobs, make_circles, make_classification, \
    make_moons

import matplotlib.pyplot as plt

import seaborn as sns
seapal = sns.color_palette('Paired', 12)
sns.set_style('ticks')

from IPython import embed


if __name__ == "__main__":

    info = {}

    X, y = make_blobs(30, n_features=2, centers=2, cluster_std=2,
                      random_state=42)
    info["Blobs"] = {'X': X, 'y': y}

    X, y = make_circles(100, noise=0.1, factor=0.4, random_state=42)
    info["Circles"] = {'X': X, 'y': y}

    X, y = make_moons(100, noise=0.1, random_state=42)
    info["Moons"] = {'X': X, 'y': y}

    X, y = make_classification(100, 2, n_informative=1, n_redundant=0,
                               n_clusters_per_class=1, random_state=1)
    info["Classification"] = {'X': X, 'y': y}



    for key, val in info.items():

        with open("../Data/{}.hs".format(key), 'w') as f:
            X = val['X']
            y = val['y']

            y[y == 0] = -1

            f.write("module Data.{}\n( x\n, y\n) where\n\n".format(key))

            f.write("x = [")
            for xi in X[:-1]:
                f.write("[{:6.4f}, {:6.4f}], ".format(xi[0], xi[1]))
            f.write("[{:6.4f}, {:6.4f}]]\n".format(X[-1,0], X[-1,1]))

            f.write("\ny :: [Double]")
            f.write("\ny = [")
            for yi in y[:-1]:
                f.write("{:d}, ".format(yi))

            f.write("{:d}]\n".format(y[-1]))



    #fig, ax = plt.subplots()

    ## Plot data points
    #scolour = [seapal[1] if i==-1 else seapal[3] for i in y]
    #ax.scatter(X[:,0], X[:,1], c=scolour, s=42,
    #           edgecolors=plt.cm.binary(0), alpha=0.8, zorder=100)


    #ax.set_xlabel(r'$x_1$', fontsize=14)
    #ax.set_ylabel(r'$x_2$', fontsize=14)

    #plt.show()
