<template>
    <div>
        <b-table
                hover v-if="currencies.length"
                sticky-header="800px"
                :items="currencies"
                :fields="fields"
                head-variant="light"
                @row-clicked="editCurrency">
            <template v-slot:cell(action)="row">
                <b-button variant="danger" @click="delete_currency(row.item.id)">Delete</b-button>
            </template>
        </b-table>
        <h1 v-else>No currencies</h1>
    </div>
</template>

<script>
    import router from "@/router";
    import { mapState, mapActions } from 'vuex';

    export default {
        name: "CurrencyList",
        computed: {
            ...mapState(['currencies'])
        },
        data() {
            return {
                fields: [
                    { key: 'naziv' },
                    { key: 'tracer' },
                    { key: 'opis' },
                    { key: 'action' }
                ]
            }
        },
        methods: {
            ...mapActions(['delete_currency']),

            editCurrency: function (item, index, event) {
                router.push({path: `/currency/${item.id}`})
            }
        }
    }
</script>

<style>
    tr:hover td{
        background: lightgreen;
    }
</style>