#Class 05:Data Visualization

#ggplot2 package

#load the packages
library(ggplot2)
#ggplot layers: data+aes+geoms
head(cars)
ggplot(data = cars) +
  aes(x = speed, y = dist) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "Stopping Distance of Old Cars", x ="Speed (MPH)",
       y = "Stopping Distance(ft)")
#popular graphic system "base" R graphics
plot(cars$speed, cars$dist)


#RNA seq data
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)
#how many genes are in the dataset
nrow(genes)
#how many genes are "up"?
table(genes$State)
#what % are up?
round(table(genes$State)/nrow(genes)*100, 3)

#lets make a figure
p <- ggplot(genes) +
  aes(x = Condition1, y = Condition2, col = State) +
  geom_point()
  
p + scale_color_manual(values = c("blue", "gray", "red"))

#install gapminder
library(gapminder)
head(gapminder)


#make a new plot of year vs lifespan

ggplot(gapminder) +
  aes(x = year, y = lifeExp, col = continent) +
  geom_jitter(width = 0.3, alpha = 0.4) +
  geom_violin(aes(group = year), alpha = 0.2,
              draw_quantiles = 0.5)
  

#install the plotly
library(plotly)
ggplotly()

