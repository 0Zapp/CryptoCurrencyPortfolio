<template>
  <b-container fluid>
    <label for="name">Address from:</label>
    <b-input v-model="newFrom" class="mb-2 mr-sm-2 mb-sm-0"></b-input>
    <label for="to">Address to:</label>
    <b-input v-model="newTo" class="mb-2 mr-sm-2 mb-sm-0"></b-input>
    <label for="description">Amount:</label>
    <b-input v-model="newAmount"></b-input>
    <b-button variant="primary" size="lg" @click="addNew"
      >Add Transaction</b-button
    >
  </b-container>
</template>

<script>
import { mapActions } from "vuex";
import router from "@/router";

export default {
  name: "EditMessage",

  data() {
    return {
      newFrom: "",
      newTo: "",
      newAmount: "",

    };
  },

  methods: {
    ...mapActions(["new_transaction"]),

    addNew: function () {
      const msg = JSON.stringify({
        from: this.newFrom,
        to: this.newTo,
        amount: this.newAmount,
        valutaId: this.$route.params.id
      });

      this.new_transaction(({ id: this.$route.params.id, msg: msg }));

      this.newFrom = "";
      this.newTo = "";
      this.newAmount = "";


      router.push({ path: `/` });
    },
  },
  mounted: function () {
    this.newFrom = this.from;
    this.newTo = this.to;
    this.newAmount = this.amount;

    },
};
</script>

<style scoped>
</style>