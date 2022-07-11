import { types } from "../../types";

const initialState = {
    conocimientos: [],
    tipos_cargo: []
}

export const itemsReducer = (state = initialState, actions) => {
    switch (actions.type) {
        case types.getConocimiento:
            return {
                ...state,
                conocimientos: actions.payload,
            }
        case types.getTipoCargo:
            return {
                ...state,
                tipos_cargo: actions.payload,
            }
        default:
            return state;
    }
}