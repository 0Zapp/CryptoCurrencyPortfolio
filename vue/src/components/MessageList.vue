<template>
    <div>
        <b-table
                hover v-if="messages.length"
                sticky-header="800px"
                :items="messages"
                :fields="fields"
                head-variant="light"
                @row-clicked="editMessage">
            <template v-slot:cell(action)="row">
                <b-button variant="danger" @click="delete_message(row.item.id)">Delete</b-button>
            </template>
        </b-table>
        <h1 v-else>No messages</h1>
    </div>
</template>

<script>
    import router from "@/router";
    import { mapState, mapActions } from 'vuex';

    export default {
        name: "MessageList",
        computed: {
            ...mapState(['messages'])
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
            ...mapActions(['delete_message']),

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