<template>

    <b-container fluid>
        <b-row>
            <b-col sm="2">
                <label for="user">User:</label>
            </b-col>
            <b-col sm="10">
                <p id="user" style="text-align: left">{{ message.user }}</p>
            </b-col>
        </b-row>

        <b-row class="mt-2">
            <b-col sm="2">
                <label for="msg">Message:</label>
            </b-col>
            <b-col sm="10">
                <p id="msg" style="text-align: left">{{ message.message }}</p>
            </b-col>
        </b-row>
    </b-container>
</template>

<script>
    export default {
        name: "ShowCurrency",
        props: {
            message: Object
        }
    }
</script>