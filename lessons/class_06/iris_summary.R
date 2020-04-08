# summary statistics for the {iris} data 

summary(iris)

# linear regression of Sepal.Length predicted by Sepal.Width

mod_petal <- lm(Petal.Length ~ Petal.Width, iris)

summary(mod_petal)

