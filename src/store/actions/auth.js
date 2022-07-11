import { axiosInstance } from "../../config/axios";
import { types } from "../../types";

export const startLogin = (user) => {
    return async (dispatch) => {
        const { data } = await axiosInstance.post('api/login', user)
        dispatch(login(data[0]))
        localStorage.setItem('user', JSON.stringify(data[0]))
    }
}

export const login = (user) => ({
    type: types.authLogin,
    payload: user
})