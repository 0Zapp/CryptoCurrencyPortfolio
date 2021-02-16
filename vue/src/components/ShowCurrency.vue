<template>

    <b-container fluid>
        <b-row>
            <b-col sm="2">
                <label for="name">Name:</label>
            </b-col>
            <b-col sm="10">
                <p id="name" style="text-align: left">{{ message.name }}</p>
            </b-col>
        </b-row>

        <b-row class="mt-2">
            <b-col sm="2">
                <label for="description">Description:</label>
            </b-col>
            <b-col sm="10">
                <p id="description" style="text-align: left">{{ message.description }}</p>
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