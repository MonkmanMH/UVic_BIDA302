## CLASS 1
#
### Example 2
#
#### Steps
#
#1. Open RStudio
#
#
#2. Make a chart
#
# (R4DS Chapter 1)

# load the package {ggplot2} -- part of {tidyverse}
library(ggplot2)

# load the data frame `mpg`
# > define data frame
mpg

# > In R, we are code/instruction first, data behind
# > Call "HELP" to find out more about the data (also works for functions)

?mpg

# > Let's make a chart that plots 
# > the size of the engine (`displ`) on the X axis and
# > the highway fuel consumtion (`hwy`) on the Y
# > (i.e. an XY scatterplot)
# >
# > Do you have a hypothesis about this relationship?

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

# > Congratulations! You have written some R code that makes a chart!
#
# > Now let's look at that chart...
# > What happens to fuel economy as an engine gets larger?
#
# > When we come back to making plots in a couple (?) of weeks
# > we will discuss what's going on in the code you just wrote and
# > how you can elaborate on what you've just created
# > -- differentiating the points by, say, type of vehicle (`class`),
# > adding titles, better labels, and other formatting improvements

# > But for now...make a chart that shows the relationship between
# > engine displacement and _city_ mileage
# > For this you may want to use:
# > - `?` to get the variable for city mileage
# > - copy & paste (remember, painting sombreros on the pandas!)


