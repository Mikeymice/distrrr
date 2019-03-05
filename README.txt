DSCI 524 Milestone 1 README
===========================

  Contributors     GitHub Handle
  ---------------- -----------------------------------------------------
  Carrie Cheung    [carrieklc](https://github.com/carrieklc)
  Evan Yathon      [EvanYathon](https://github.com/EvanYathon)
  Mike Yuan        [mikeymice](https://github.com/mikeymice)
  Shayne Andrews   [shayne-andrews](https://github.com/shayne-andrews)

Project Summary
---------------

`distrrr` is a R package that calculates distances between numeric-based
data points or observations. The currently supported distance metrics
are:

-   [Euclidean
    Distance](https://en.wikipedia.org/wiki/Euclidean_distance)
-   [Manhattan Distance](https://en.wikipedia.org/wiki/Taxicab_geometry)
-   [Cosine Similarity](https://en.wikipedia.org/wiki/Cosine_similarity)

In addition to computing distances, `distrrr` can identify the closest
data points to a given point based on a distance threshold, or based on
a user-specified number of points. These functions are designed to be
similar to [Scikit Learn's Nearest
Neighbors](https://scikit-learn.org/stable/modules/generated/sklearn.neighbors.NearestNeighbors.html#sklearn.neighbors.NearestNeighbors.kneighbors)
functionality.

Test Coverage
-------------

We used the R library [`covr`](https://github.com/r-lib/covr) to track
our test coverage for the `distrrr` package. The results of the coverage
report show 100% test coverage for each line of function implementation
code.

![](/reports/distrrr_test_coverage.png) \#\# Functions

  -------------------------------------------------------------------------------------------------------------------------------------------------------
  Function Name                                         Input                   Output                     Description
  ----------------------------------------------------- ----------------------- -------------------------- ----------------------------------------------
  get\_distance                                         3 parameters: 2 vectors Floating point number      Given 2 observations each represented by a
                                                        of numeric values, a                               vector of numeric values, compute and return
                                                        character specifying                               the distance between the 2 points based on the
                                                        type of distance metric                            specified distance metric (e.g.
                                                                                                           `metric="euclidean"`)

  get\_all\_distances                                   3 parameters: a vector  Vector of floats of length Given a dataframe and an observation
                                                        of numeric values, a    n                          represented by a single vector of numeric
                                                        dataframe, a character                             values, compute and return the distances
                                                        specifying type of                                 between the single observation and each
                                                        distance metric                                    observation in the dataframe based on the
                                                                                                           specified distance metric. Will output a
                                                                                                           vector of distances (as numeric values) with
                                                                                                           size equal to the number of rows in the
                                                                                                           dataframe, `n`.

  filter\_distances                                     4 parameters: a list of Vector of numerics (row    Similiar to `get_all_distances` except indices
                                                        numeric values, a       indices)                   of rows/observations with distances less than
                                                        dataframe, a numeric                               the threshold distance will be returned.
                                                        (float or integer)                                 
                                                        value representing a                               
                                                        threshold distance, a                              
                                                        character specifying                               
                                                        type of distance metric                            

  get\_closest                                          4 parameters: a vector  Vector of numerics (row    Similiar to `get_all_distances` except indices
                                                        specifying values for a indices) of length k       of the top `k` rows/observations with the
                                                        target point, a                                    smallest distances are returned. In the case
                                                        dataframe, an int for                              where there is a tie in distances between two
                                                        number of neighbours k,                            or more points, the point with smaller index
                                                        a character specifying                             in the dataframe will be selected.
                                                        type of distance metric                            
  -------------------------------------------------------------------------------------------------------------------------------------------------------

Alignment with Python / R Ecosystems
------------------------------------

There are existing packages that implement the same proposed
functionality in both Python and R (listed below). Most of these
packages provide functions to calculate different distance metrics
between observations and/or also extend the functionality to compute the
k nearest neighbours (KNN) of a given point based on a selected distance
metric.

In our package, we will be implementing the distance metric calculations
manually rather than simply creating wrappers around existing functions.

  Existing Packages/Functions
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
  [Sklearn's NearestNeighbors](https://scikit-learn.org/stable/modules/generated/sklearn.neighbors.NearestNeighbors.html#sklearn.neighbors.NearestNeighbors.kneighbors)
  [Scipy's Spatial Distance Functions](https://docs.scipy.org/doc/scipy/reference/spatial.distance.html)
  [R Distance Computations](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/dist.html)
  [R K Nearest Neighbours](https://cran.r-project.org/web/packages/FNN/index.html)

Installation
------------

To install the package, simply run the below in R console:

`devtools::install_github("UBC-MDS/distrrr")`

Then simply import `distrrr` in your own development. For example:

    >>> library(distrrr)
    > get_distance(c(1,2),c(2,1))
    [1] 1.414214

Example Usages
--------------

  -----------------------------------------------------------------------------------------------------------
  Function Name                                            Example Usage(s)
  -------------------------------------------------------- --------------------------------------------------
  get\_distance                                            `get_distance(c(1,2), c(0,1), "manhattan")`

  get\_all\_distances                                      <code>x &lt;- c(-2,4)</code><br><code>df &lt;-
                                                           data.frame("A" = c(1,2,3), "B" =
                                                           c(8,2,4))</code><br><code>get\_all\_distances(x,
                                                           df, metric = "euclidean")</code>

  filter\_distances                                        <code>x &lt;- c(1, 1)<br>df &lt;- data.frame("A" =
                                                           c(1,2,3), "B" = c(8,2,4))<br>filter\_distances(x,
                                                           df, threshold=0.9, metric="euclidean")</code>

  get\_closest                                             <code>x &lt;- c(1, 1) <br> df &lt;- data.frame("A"
                                                           = c(1,2,3), "B" = c(8,2,4)) <br> get\_closest(x,
                                                           df, top\_k=2, "manhattan")</code>
  -----------------------------------------------------------------------------------------------------------
