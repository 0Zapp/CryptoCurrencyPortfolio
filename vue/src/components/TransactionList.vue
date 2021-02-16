<template>
  <div>
    <b-table
      hover
      v-if="transactions.length"
      sticky-header="800px"
      :items="transactions"
      :fields="fields"
      head-variant="light"
    >
    </b-table>
    <b-button @click="new_transaction">New Transaction</b-button>
  </div>
</template>

<script>
import router from "@/router";
import { mapState, mapActions } from "vuex";

export default {
  name: "TransactionList",

  computed: {
    ...mapState(["transactions"]),
  },
  data() {
    return {
      fields: [
        { key: "amount" },
        { key: "created_at" },
        { key: "adressFrom" },
        { key: "adressTo" },
      ],
      valutaId: "",
    };
  },
  methods: {
    ...mapActions(["delete_currency", "load_transactions"]),

    editCurrency: function (item, index, event) {
      router.push({ path: `/currency/${item.id}` });
    },

    new_transaction: function (item, index, event) {
      router.push({ path: `/transaction/${this.$route.params.id}`});
    },
  },
  mounted: function () {
    this.valutaId = this.$route.params.id;
    this.load_transactions(this.valutaId);
  },
};
</script>

<style>
tr:hover td {
  background: lightgreen;
}
</style>