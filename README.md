# DSCI 524 Milestone 1 README

|Contributors|GitHub Handle|
|------------|-------------|
|Carrie Cheung| [carrieklc](https://github.com/carrieklc)|
|Evan Yathon|[EvanYathon](https://github.com/EvanYathon)|
|Mike Yuan|[mikeymice](https://github.com/mikeymice)|
|Shayne Andrews|[shayne-andrews](https://github.com/shayne-andrews)|


## Project Summary
`distrrr` and `pydistrrr` are R and Python packages respectively that calculate distance metrics between vectors.  Users can find closest distances based either on a threshold distance or specified number of outputs to find vectors that are similar to their input.  These functions are designed to be similar to [Scikit Learn's Nearest Neighbors](https://scikit-learn.org/stable/modules/generated/sklearn.neighbors.NearestNeighbors.html#sklearn.neighbors.NearestNeighbors.kneighbors) functionality.

## Functions

|Function Name|Input|Output|Description|
|-------------|-----|------|-----------|
|get_distance|3 parameters:  2 lists of numeric values, a string specifying type of distance metric | Single float| Given 2 observations each represented by a list of numeric values, compute and return the distance between the 2 points based on the specified distance metric (e.g. `metric="euclidean"`)|
|get_all_distances |3 parameters:  a dataframe, a list of numeric values, a string specifying type of distance metric  | List of floats of length n| Given a dataframe and an observation represented by a single list of numeric values, compute and return the distances between the single observation and each observation in the dataframe based on the specified distance metric. Will output a list of distances (as numeric values) with size equal to the number of rows in the dataframe, `n`.|
|filter_distances| 3 parameters: a dataframe, a list of numeric values, a numeric (float or int) value representing a threshold distance |List of int (row indices)| Similiar to `get_all_distances` except indices of rows/observations with distances less than the threshold distance will be returned.|
|get_closest|4 parameters: a dataframe, a list of numeric values k, int for number of neighbours, a string specifying type of distance metric  |List of int (row indices) of length k| Similiar to `get_all_distances` except indices of the top `k` rows/observations with the smallest distances are returned.|


## Alignment with Python / R Ecosystems

There are existing packages that implement the same proposed functionality in both Python and R (listed below). Most of these packages provide functions to calculate different distance metrics between observations and/or also extend the functionality to compute the k closest neighbours (KNN) of a given point based on a selected distance metric.

|Existing Packages/Functions|
|---------------------------|
|[Sklearn's NearestNeighbors](https://scikit-learn.org/stable/modules/generated/sklearn.neighbors.NearestNeighbors.html#sklearn.neighbors.NearestNeighbors.kneighbors)|
|[Scipy's Spatial Distance Functions](https://docs.scipy.org/doc/scipy/reference/spatial.distance.html)|
|[R Distance Computations](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/dist.html)|
|[R K Nearest Neighbours](https://cran.r-project.org/web/packages/FNN/index.html)||
