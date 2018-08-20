# ggvis interactive distributions
#
# Jesse Bockstedt
# bockstedt.com
# For ISOM 675 Data Visualization, Goizueta Business School, Emory University
#
# Description:
# Brief examples using the ggvis library in R to make interactive distribution plots
# Based on the ggvis examples and tutorials at http://ggvis.rstudio.com/
# More examples of ggvis interactive plots can be found at the link above.

require(ggvis)


#----Interactive Histograms-----#


p <- ggvis(mtcars, ~wt)
layer_histograms(p, width =  input_slider(0, 2, step = 0.10, label = "width"),
                 center = input_slider(0, 2, step = 0.05, label = "center"))


#Using Pipe Notation
mtcars %>% 
  ggvis(~wt) %>% 
  layer_histograms(width =  input_slider(0, 2, step = 0.10, label = "width"),
                   center = input_slider(0, 2, step = 0.05, label = "center"))

#----Interactive Kernel Densities-----#

layer_densities(p,    
                adjust = input_slider(.1, 2, value = 1, step = .1, label = "Bandwidth adjustment"),
                kernel = input_select(
                  c("Gaussian" = "gaussian",
                    "Epanechnikov" = "epanechnikov",
                    "Rectangular" = "rectangular",
                    "Triangular" = "triangular",
                    "Biweight" = "biweight",
                    "Cosine" = "cosine",
                    "Optcosine" = "optcosine"),
                  label = "Kernel")
)

#Using Pipe Notation
mtcars %>% ggvis(x = ~wt) %>%
  layer_densities(
    adjust = input_slider(.1, 2, value = 1, step = .1, label = "Bandwidth adjustment"),
    kernel = input_select(
      c("Gaussian" = "gaussian",
        "Epanechnikov" = "epanechnikov",
        "Rectangular" = "rectangular",
        "Triangular" = "triangular",
        "Biweight" = "biweight",
        "Cosine" = "cosine",
        "Optcosine" = "optcosine"),
      label = "Kernel")
  )