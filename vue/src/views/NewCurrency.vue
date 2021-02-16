<template>
    <div class="home">
        <b-container>
            <b-row>
                <b-col cm="6" >
                    <EditCurrency/>
                </b-col>
            </b-row>
        </b-container>
    </div>
</template>

<script>
    import EditCurrency from "@/components/EditCurrency";

    export default {
        name: "NewCurrency",
        components: {
            EditCurrency
        }
    }
</script>

<style scoped>

</style>