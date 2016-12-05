import numpy as np
from sklearn.datasets import make_blobs, make_circles
from scipy.ndimage.interpolation import zoom, spline_filter
from scipy.ndimage.filters import gaussian_filter

import matplotlib.pyplot as plt

import seaborn as sns
seapal = sns.color_palette('Paired', 12)
sns.set_style('ticks')

from IPython import embed


def predict(phi, w):
    '''Make predictions in a feature space using a perceptron with weights w.'''

    Xa = np.hstack((np.ones(len(phi))[:, None], phi))
    return np.sign(Xa.dot(w))

def predict_mesh(x, y, w):
    '''Compute predictions for a mesh of coordinates. Used for plotting.'''

    resx, resy = len(x), len(y)
    Xm = np.meshgrid(x, y)
    Xc = np.reshape(Xm, (2, resx*resy)).T

    t = predict(phi(Xc), w)

    return np.reshape(t, (resx, resy))


def phi(X):
    '''Define feature space.'''

    x1 = X[:,0]
    x2 = X[:,1]

    #extra = np.array([x1**2, x2**2]).T
    #extra = np.array([x1**3, x2**2]).T
    extra = np.atleast_2d(x1 * x2).T
    #extra = np.array([np.linalg.norm(X, axis=1)]).T
    #extra = np.array([x1**2, x2**2, x1**3, x2**3]).T
    #extra = np.array([x1*x2, x1*x2**2, x1*x2**3]).T
    #extra = np.array([x1*x2, x1*x2**2, x1*x2**3, x1*x2**4]).T
    #extra = np.array([x1*x2, x1*x2**2, x1*x2**3, x1*x2**4, x1**2, x2**2]).T

    Xa = np.hstack((X, extra))  # Use a feature space
    #Xa = X                     # Don't use a feature space

    return Xa

if __name__ == "__main__":


    X, y = make_blobs(30, n_features=2, centers=2, cluster_std=2,
                      random_state=42
                      )
    #X, y = make_circles(100, noise=0.1, factor=0.4, random_state=42)

    # Define weights:
    #w = [2.,-1.] # one solution!
    #w = [2.0,8.6146,-4.270200000000001]
    w = [1.0,22.3303,-31.955700000000004,13.257563810000004]

    # Normalise weight vector:
    w = np.array(w)
    w /= np.linalg.norm(w)

    y[y == 0] = -1

    fig, ax = plt.subplots()

    # Plot data points
    scolour = [seapal[1] if i==-1 else seapal[3] for i in y]
    ax.scatter(X[:,0], X[:,1], c=scolour, s=42,
               edgecolors=plt.cm.binary(0), alpha=0.8, zorder=100)

    limits = ax.axis()

    # Compute grid:
    res = 100   # resolution
    x1 = np.linspace(limits[0], limits[1], res)
    x2 = np.linspace(limits[2], limits[3], res)
    xx,yy = np.meshgrid(x1, x2)

    # Make predictions and smooth them to create a nicer looking contour plot:
    t = predict_mesh(x1, x2, w)
    smooth_t = gaussian_filter(t, 5, mode='nearest')

    # Make contour plot:
    ax.contourf(xx, yy, smooth_t, levels=[-10,0,10], colors=[seapal[0],
                                                    seapal[2]], zorder=-10,
                alpha=.3)
    ax.contour(xx, yy, smooth_t, levels=[0],
               colors=[seapal[6]],
               zorder=0,
               antialiased=True)

    # Set plot limits and labes:
    ax.axis(limits)

    ax.set_xlabel(r'$x_1$', fontsize=14)
    ax.set_ylabel(r'$x_2$', fontsize=14)

    plt.show()
    #plt.savefig("../figures/w11.png")
