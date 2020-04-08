# iris petal plot
ggplot(iris, aes(x = Petal.Width, y = Petal.Length)) +
  geom_point() +
  geom_smooth(method = lm)
