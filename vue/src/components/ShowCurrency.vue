<template>

    <b-container fluid>
        <b-row>
            <b-col sm="2">
                <label for="naziv">Naziv:</label>
            </b-col>
            <b-col sm="10">
                <p id="naziv" style="text-align: left">{{ message.naziv }}</p>
            </b-col>
        </b-row>
        <b-row>
            <b-col sm="2">
                <label for="tracer">Tracer:</label>
            </b-col>
            <b-col sm="10">
                <p id="tracer" style="text-align: left">{{ message.tracer }}</p>
            </b-col>
        </b-row>

        <b-row class="mt-2">
            <b-col sm="2">
                <label for="opis">Opis:</label>
            </b-col>
            <b-col sm="10">
                <p id="opis" style="text-align: left">{{ message.opis }}</p>
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