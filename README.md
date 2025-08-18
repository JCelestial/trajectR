# molFrameR v0.4.9
### *What if Histograms were more descriptive?*
Inspired by the Density calculations in Theoretical Chemistry and Statistical Mechanics, **molFrameR** will make density statistics much easier to calculate visualize!


------------------------------------------------------------------------------------------------------------------------------------
### "But, R already has histograms!"
You may be familiar with R and ggplot2's density curves to represent frequency statistics, such as this one:
<img src="https://github.com/JCelestial/molFrameR/blob/master/density1.jpg" width="275" height="300">

But, what if you want to describe the the plot by metrics other than frequencies? such as mean values?


|  |  |  |  |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| **x** | 1 | 2 | 1 | 1 | 3 | 3 | 1 | 2 | 1 |
| **y** | a | b | c | d | e | f | g | h | i |

Take the following table above as an example, let's say you want to bin all values such that the x values in the plot is 1, 2, and 3. But, instead of counting the frequency of the values, you want to take the mean of all values that correspond to x = 1 to give a mean value of all entries, so you end up with the table below:

| bins     | mean(y)                               |
| -------- |:-------------------------------------:|
| 1        | (sum(a + c + d + g + i)/count(x = 1)) |
| 2        | (sum(b + h)/count(x = 2))             |
| 3        | (sum(e + f)/count(x = 3))             |

This is the problem **molFrameR** aims to solve by providing functions that will allow one to organize data in such a way without requiring SQL libraries to manipulate the data frames using keys and joins. **molFrameR** also contains other parameters that makes the resulting data more customizable.

------------------------------------------------------------------------------------------------------------------------------------
### Features
Now that we know what **molFrameR** is used for, let's take a look at the bells and whistles!

*Custom histogram bin sizing!*

Yes, the bin function also allows one to declare how large the histogram sizes are to manipulate the resolution of the density plot.

*SQL-like capabilities without requiring knowledge in SQL!*

In addition, **molFrameR** contains functions that also allow one to compare multiple tables and join them based on conditions, i.e. creating a new table with entries from either data frames that are compared line per line. Quite similar to how SQL makes use of joins and unions.

*Compatibility with packages such as DplyR and magrittR pipelines!*

**molFrameR** functions can be included as part of data munging done with DplyR.

------------------------------------------------------------------------------------------------------------------------------------
### To do list and Future Plans

#### To do
* change method names for generalization
* add overloaded methods with default values
* upload to R CRAN repositories


#### Future Plans
* implement other methods such as Monte Carlo sampling
* create a Python library counterpart
