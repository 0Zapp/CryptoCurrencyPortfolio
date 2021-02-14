<template>
    <div>
        <Header/>
        <b-container>
            <b-row>
                <b-col cm="6" >
                    <div v-if="edit">
                        <EditMessage :user="message.user" :message="message.message"/>
                    </div>
                    <div v-else>
                        <ShowMessage v-if="messages.length" :message="message"/>
                    </div>
                </b-col>
            </b-row>
            <b-row>
                <b-col cm="2" style="margin-top: 10px">
                    <b-button variant="primary" size="lg" @click="toggleEdit" v-html="edit ? 'Cancel' : 'Edit'"/>
                </b-col>
            </b-row>
        </b-container>
    </div>
</template>

<script>
    import EditMessage from "@/components/EditMessage";
    import Header from "@/components/Header";
    import ShowMessage from "@/components/ShowMessage";
    import { mapState, mapActions } from 'vuex';

    export default {
        name: "Message",
        components: {
            Header,
            EditMessage,
            ShowMessage
        },
        data() {
            return {
                edit: false
            }
        },
        computed: {
            ...mapState(['messages']),

            message: function () {
                for (let i = 0; i < this.messages.length; i++)
                    if (this.messages[i].id === parseInt(this.$route.params.id))
                        return this.messages[i];
            }
        },
        methods: {
            ...mapActions(['load_messages']),

            toggleEdit: function () {
                this.edit = !this.edit
            }
        }
    }
</script>

<style scoped>

</style>