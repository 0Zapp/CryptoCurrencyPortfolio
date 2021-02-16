<template>
    <div>
        <b-table
                hover v-if="currencies.length"
                sticky-header="800px"
                :items="currencies"
                :fields="fields"
                head-variant="light"
                @row-clicked="editMessage">
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
        name: "MessageList",
        computed: {
            ...mapState(['currencies'])
        },
        data() {
            return {
                fields: [
                    { key: 'user' },
                    { key: 'message' },
                    { key: 'time' },
                    { key: 'action' }
                ]
            }
        },
        methods: {
            ...mapActions(['delete_currency']),

            editMessage: function (item, index, event) {
                router.push({path: `/message/${item.id}`})
            }
        }
    }
</script>

<style>
    tr:hover td{
        background: lightgreen;
    }
</style>