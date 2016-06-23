# --------------------------------------------------------------------------
# Classification of fruits based on reflectance data
# Code by Shreyas Skandan Shivakumar at University of Pennsylvania (2016)
# --------------------------------------------------------------------------

import numpy as np
import matplotlib.pyplot as plt
from sklearn import svm, datasets


filename = 'data/svmData.dat'
allData = np.loadtxt(filename, delimiter=',')

X = allData[:,:-1]
Y = allData[:,-1]


C = 0.01

print "Training SVM"
clf = svm.SVC(C=C,kernel='linear')
clf.fit(X, Y)

print "Testing SVM"

h = .02  
x_min, x_max = X[:, 0].min() - 1, X[:, 0].max() + 1
y_min, y_max = X[:, 1].min() - 1, X[:, 1].max() + 1
xx, yy = np.meshgrid(np.arange(x_min, x_max, h), np.arange(y_min, y_max, h))
Z = clf.predict(np.c_[xx.ravel(), yy.ravel()])

Z = Z.reshape(xx.shape)
plt.pcolormesh(xx, yy, Z, cmap=plt.cm.Paired)
plt.scatter(X[:, 0], X[:, 1], c=Y, cmap=plt.cm.Paired)
plt.title('SVM decision surface with C = '+str(C))
plt.axis('tight')
plt.show()