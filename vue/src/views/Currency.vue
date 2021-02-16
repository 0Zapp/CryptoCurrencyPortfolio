<template>
    <div>
        <b-container>
            <b-row>
                <b-col cm="6" >
                    <div v-if="edit">
                        <EditCurrency :naziv="message.naziv" :tracer="message.tracer" :opis="message.opis" />
                    </div>
                    <div v-else>
                        <ShowCurrency v-if="currencies.length" :message="message"/>
                    </div>
                    
                </b-col>
            </b-row>
            <b-row>
                <b-col cm="2" style="margin-top: 10px">
                    <b-button variant="primary" size="lg" @click="toggleEdit" v-html="edit ? 'Cancel' : 'Edit'"/>
                </b-col>
            </b-row>
            <label for="naziv">Transactions:</label>
                    <div >
                         <TransactionList/>
                    </div>
        </b-container>
    </div>
</template>

<script>
    import EditCurrency from "@/components/EditCurrency";
    import ShowCurrency from "@/components/ShowCurrency";
    import { mapState, mapActions } from 'vuex';
    import TransactionList from "@/components/TransactionList";

    export default {
        name: "Message",
        components: {
            EditCurrency,
            ShowCurrency,
            TransactionList
        },
        data() {
            return {
                edit: false
            }
        },
        computed: {
            ...mapState(['currencies']),


            message: function () {
                for (let i = 0; i < this.currencies.length; i++)
                    if (this.currencies[i].id === parseInt(this.$route.params.id))
                        return this.currencies[i];
            }
        },
        methods: {
            ...mapActions(['load_currencies']),

            toggleEdit: function () {
                this.edit = !this.edit
            }
        }
    }
</script>

<style scoped>

</style>