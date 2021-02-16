<template>
  <div>
    <b-table
      hover
      v-if="transactions.length"
      sticky-header="800px"
      :items="transactions"
      :fields="fields"
      head-variant="light"
      @row-clicked="editCurrency"
    >
    </b-table>
    <b-button variant="primary" size="lg" @click="newTransaction">New Transaction</b-button>
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
      fields: [{ key: "ammount" }, { key: "time" }, { key: "adressFrom" }, { key: "adressTo" }],
      valutaId: "",
    };
  },
  methods: {
    ...mapActions(["delete_currency", "load_transactions"]),

    editCurrency: function (item, index, event) {
      router.push({ path: `/currency/${item.id}` });
    },

    newTransaction: function(){
        console.log("yo")
    }
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