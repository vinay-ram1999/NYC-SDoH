from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.metrics import (
    mean_absolute_error,
    mean_squared_error,
    r2_score
)
from sklearn.ensemble import RandomForestRegressor
import pandas as pd


def split_train_test(df: pd.DataFrame, target: str, test_split_size: float=0.3, stratify_col_name: str=None) -> list:
    stratify_col = None
    if stratify_col_name:
        stratify_col = df[stratify_col_name].to_numpy()
        df.drop(stratify_col_name, axis=1, inplace=True)
    X = df.drop(target, axis=1).to_numpy()
    y = df[target].to_numpy()
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=test_split_size, random_state=42, stratify=stratify_col)
    return X_train, X_test, y_train, y_test


def model_metrics(regressor, X, y):
    y_pred = regressor.predict(X)
    mae = mean_absolute_error(y_true=y, y_pred=y_pred)
    mse = mean_squared_error(y_true=y, y_pred=y_pred)
    r2 = r2_score(y_true=y, y_pred=y_pred)
    print(f"{regressor} Mean Absolute Error: ", mae)
    print(f"{regressor} Mean Squared Error: ", mse)
    print(f"{regressor} R Squared: ", r2)
    adj_r2 = 1 - ((1 - r2) * (X.shape[0] - 1) / (X.shape[0] - X.shape[1] - 1)) # from Renda's notebook
    print(f"{regressor} Adjusted R Squared: ", adj_r2)
    if isinstance(regressor, RandomForestRegressor) and hasattr(regressor, 'oob_score_'):
        print(f"{regressor} Out-Of-Bag Score: ", regressor.oob_score_)
    return

def gridsearch_crossval(regressor, params, X, y, cv, scoring):
    grid_search = GridSearchCV(estimator=regressor, param_grid=params, scoring=scoring, n_jobs=-1, cv=cv, verbose=0)
    grid_search.fit(X, y)
    best_estimator = grid_search.best_estimator_
    return best_estimator
