import { types } from "../../types/index";

const initialState = {
    user: null,
};

export const authReducer = (state = initialState, action) => {
    switch (action.type) {
        case types.authLogin:
            return {
                user: action.payload,
            };
        default:
            return state;
    }
};