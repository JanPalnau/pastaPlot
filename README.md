
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pastaPlot

<!-- badges: start -->
<!-- badges: end -->

pastaPlot allows you to plot fixed and random effects of a linear mixel
model of class ‘lme4’ or ‘glmmTMB’ in a single spaghetti plot. While the
pastaPlot() returns a ggplot object, most basic customizations can be
done within the function itself. So feel free to check the documentation
before further modifying the plot yourself!

Predicted values and confidence intervals of fixed effects are
calculated using ggpredict() function from
[ggeffects](https://strengejacke.github.io/ggeffects/reference/ggpredict.html)
package (Lüdecke, 2018). At this stage, random effects can only be
plotted for one variable at a time. Here, the cookPasta function
automatically checks if you specified random vs. fixed intercept and
slope in your model (e.g., random intercept, random slope “(1 + time \|
id)”) and plots them accordingly.

## Installation

As the CRAN submission is pending, at this stage, you can install
pastaPlot only from [GitHub](https://github.com/):

``` r
# install.packages("devtools")
devtools::install_github("JanPalnau/pastaPlot")
```

## Examples

### ‘lme4’

Here is an example passing a lme4 model object based on longitudinal
data:

``` r
library(pastaPlot)

data("ecovia_data")
lme4_model <- lme4::lmer(CO2 ~ 1 + time*condition + (1 + time | id), data=ecovia_data, REML = FALSE, control = lme4::lmerControl(optimizer = "bobyqa"))
pastaPlot(lme4_model, "time", "id", group = "condition", legend.title = "Condition",
group.labels = c("Control", "Intervention"), ci.int = TRUE, xlab = "Time (days)",
ylab = "CO2")
```

<img src="man/figures/README-lme4_example-1.png" width="100%" />

### ‘glmmTMB’

Plotting of glmmTMB models works in the same fashion:

``` r
data("jsp_data")
glmmTMB_model <- glmmTMB::glmmTMB(math_score_y3 ~ 1 + math_score_y1*gender +
(1 + math_score_y1 | school), data=jsp_data, REML = FALSE)
pastaPlot(glmmTMB_model, "math_score_y1", "school", group = "gender",
legend.title = "Gender", group.labels = c("Male", "Female"), ci.int = FALSE,
xlab = "Math score (year 1)", ylab = "Math score (year 3)")
```

<img src="man/figures/README-glmmTMB_example-1.png" width="100%" />

If you have any questions, encounter errors, or miss some features, feel
free to contact me: <jan.palnau@mailbox.org>
