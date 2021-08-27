# The custom script for logistic regression mixed model with block effect. This model incorporates both fixed and random effects in a linear predictor expression from which the conditional mean of the response can be evaluated (Bates et al. 2015). Here, block effects are fit as fixed effect as expectation there is an effect on the dependant/response variable, in this case a fitness component.
# Bates, D., Maechler, M., Bolker, B. & Walker, S. Fitting linear mixed-effects models using lme4. J. Stat. Softw. 67, 1-48 (2015).

# The loop to run simulatenously regression model for all phenotypes at once.

> library("lme4")
> library("lmerTest")
> for (x in file[num:num]){
	mdf<-glmer(fitness~x+(1|block), family=binomial)
	md<-glmer(fitness~x+I(x^2)+(1|block), family=binomial)
	print(summary(mdf))
	print(summary(md))

# In case phenotypic measurements are missing, it's necessary to use "na.omit" function
> mdf<-glmer(fitness~x~(1|block), family=binomial,na.action=na.omit)
 