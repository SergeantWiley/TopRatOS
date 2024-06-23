import pandas as pd
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline

# Load the dataset
data = pd.read_csv('your_dataset.csv')

# Separate features and target variable
X = data.drop('target_variable', axis=1)
y = data['target_variable']

# Define the column transformer for preprocessing
numeric_features = ['numeric_feature_1', 'numeric_feature_2']
numeric_transformer = Pipeline(steps=[
    ('scaler', StandardScaler())
])

categorical_features = ['categorical_feature']
categorical_transformer = Pipeline(steps=[
    ('onehot', OneHotEncoder())
])

preprocessor = ColumnTransformer(transformers=[
    ('num', numeric_transformer, numeric_features),
    ('cat', categorical_transformer, categorical_features)
])

# Fit and transform the data with the preprocessor
X_preprocessed = preprocessor.fit_transform(X)

# Print the preprocessed data
print(X_preprocessed)
