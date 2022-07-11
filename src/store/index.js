import { createStore, combineReducers, applyMiddleware, compose } from "redux";
import thunk from "redux-thunk";

import { authReducer } from "./reducers/auth";
import { itemsReducer } from "./reducers/items";

const reducers = combineReducers({
    auth: authReducer,
    items: itemsReducer,
});

const composeEnhancers =
    (typeof window !== "undefined" &&
        window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__) ||
    compose;

export const store = createStore(
    reducers,
    composeEnhancers(applyMiddleware(thunk))
);