<template>
    <div class="home">
        <b-container>
            <b-row>
                <b-col cm="6" >
                    <EditMessage/>
                </b-col>
            </b-row>
        </b-container>
    </div>
</template>

<script>
    import EditMessage from "@/components/EditMessage";

    export default {
        name: "NewMessage",
        components: {
            EditMessage
        }
    }
</script>

<style scoped>

</style>