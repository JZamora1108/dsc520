# Assignment: ASSIGNMENT 3
# Name: ZAMORA, JESSE
# Date: 07/03/2021

scores_df <-  read.csv("c:/Users/14029/R Studio Projects/dsc520-master/data/scores.csv")

##variety subset
regular_scores_df <- scores_df[scores_df$Section == "Regular",]
str(regular_scores_df)
regular_students <- sum(regular_scores_df$Count)
regular_scores <- sum(regular_scores_df$Count * regular_scores_df$Score)
regular_avg_score = regular_scores/regular_students


##sports subset
sports_scores_df <- scores_df[scores_df$Section == "Sports",]
str(sports_scores_df)
sports_students <- sum(sports_scores_df$Count)
sports_scores <- sum(sports_scores_df$Count * sports_scores_df$Score)
sports_avg_score = sports_scores/sports_students


library(ggplot2)
library(ggthemes)

theme_set(theme_dark())  

##sports plot
gg <- ggplot(sports_scores_df, aes(x=Score, y=Count))  + 
  geom_point(aes(col=Score, size=Count)) + 
  geom_smooth(method="loess", se=F) + 
  xlim(c(200, 400)) + 
  ylim(c(0, 30)) + 
  labs(subtitle="Score Vs Count", 
       y="Number of Students Achieving the Score", 
       x="Score of Students in Sports Section", 
       title="Scatterplot", 
       caption = "Graph of Student Scores in Sports Section")

plot(gg)


##variety plot
gg <- ggplot(regular_scores_df, aes(x=Score, y=Count))  + 
  geom_point(aes(col=Score, size=Count)) + 
  geom_smooth(method="loess", se=F) + 
  xlim(c(200, 400)) + 
  ylim(c(0, 30)) + 
  labs(subtitle="Score Vs Count", 
       y="Number of Students Achieving the Score", 
       x="Score of Students in Regular Section", 
       title="Scatterplot", 
       caption = "Student Scores in Regular Section")

plot(gg)

##1Comparing and contrasting the point distributions between the two section, 
##1looking at both tendency and consistency: Can you say that one section tended to score more points than the other? 
##1Justify and explain your answer.
#A the score is very similar on both the sports and regular students with many consistencies - while the regular students may have a higher peak the 
#A sports students also performed at a similar rate just not as high of a peak - the regular students did perform much better
# less students had a low score with a lot more students achieving a higher score

##2Did every student in one section score more points than every student in the other section? 
##2If not, explain what a statistical tendency means in this context.
#A in this context, the statistical tendency or the arithmetic mean is neutral 

##3What could be one additional variable that was not mentioned in the narrative that could be 
##3influencing the point distributions between the two sections?
#A one additional variable could be time studied - because the regular students had more information to go over maybe they studied longer