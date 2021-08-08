import pandas as pd
import numpy as np

df = pd.read_csv("c:/Users/14029/R Studio Projects/dsc520-master/Life-Expectancy/data/thoracicdata.csv", encoding="utf-8-sig")
df.head()

live = df[df['Risk1Y'] == 0]
death = df[df['Risk1Y'] == 1]

cond = ['FEV', 'Performance', 'Pain', 'Haemoptysis', 'Dyspnoea', 'Cough', 'Weakness', 'TNM', 'DM', 'MI', 'PAD', 'Smoking', 'Asthma', 'AGE']

l = [np.mean(live[c]) for c in cond]
d = [np.mean(death[c]) for c in cond]

ld = pd.DataFrame(data={'Attribute': cond, 'Live 1 year mean':1, 'Death 1 Year Mean': d})
ld = ld.set_index('Attribute')

print('Death: {:d}, Live: {:d}'.format(len(death), len(live)))
print("1 year death: {:.2f}% out of 470 patients".format(np.mean(df.Risk1Y)*100))
ld

from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split

classifier = LogisticRegression()

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.33, random_state=42)

classifier.fit(X_train, y_train.values)
result = classifier.score(X_test, y_test.values)
print(f'Accuracy: {result * 100.0}')