import { axiosInstance } from "../../config/axios"
import { types } from "../../types"

export const startGetConocimiento = () => {
    return async (dispatch) => {
        const { data } = await axiosInstance.get('items/conocimiento')

        const _conocimientos = data.map(conocimiento => ({
            label: conocimiento.descripcion,
            value: conocimiento.id_conocimiento,
        }));


        dispatch(getConocimiento(_conocimientos))
    }
}

export const startGetTiposCargo = () => {
    return async (dispatch) => {
        const { data } = await axiosInstance.get('items/tipo_cargo')

        dispatch(getTipoCargo(data))
    }
}

export const getConocimiento = (conocimientos) => ({
    type: types.getConocimiento,
    payload: conocimientos,
})

export const getTipoCargo = (tipos_cargo) => ({
    type: types.getTipoCargo,
    payload: tipos_cargo,
})