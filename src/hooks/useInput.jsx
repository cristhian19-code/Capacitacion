import { useState } from "react";

export const useInput = (initialValue = '') => {
    const [value, setValue] = useState(initialValue);

    const onChange = (e) => {
        console.log(e)
        if (e.value) {
            setValue({
                ...value,
                [e.originalEvent.target.name]: e.value
            })
        } else {
            setValue({
                ...value,
                [e.target.name]: e.target.value
            })
        }
    }

    return {
        value,
        onChange
    }
}