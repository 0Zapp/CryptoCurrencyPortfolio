<template>
    <div>
        <b-jumbotron header="Message Board" :lead="'Num messages: ' + messages.length">
        </b-jumbotron>
    </div>
</template>

<script>
    import { mapState } from 'vuex';

    export default {
        name: "Header",
        computed: {
            ...mapState(['messages'])
        }
    }
</script>

<style scoped>

</style>