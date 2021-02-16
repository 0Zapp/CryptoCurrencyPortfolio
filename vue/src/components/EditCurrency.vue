<template>
  <b-container fluid>
    <label for="naziv">Naziv:</label>
    <b-input
      v-model="newNaziv"
      class="mb-2 mr-sm-2 mb-sm-0"
      placeholder="Bitcoin,Etherium,Dogecoin..."
    ></b-input>
    <label for="naziv">Tracer:</label>
    <b-input
      v-model="newTracer"
      class="mb-2 mr-sm-2 mb-sm-0"
      placeholder="BTC,ETC,DOGE..."
    ></b-input>
    <label for="naziv">Opis:</label>
    <b-form-textarea
      v-model="newOpis"
      placeholder="Bitcoin je decentralizova..."
    ></b-form-textarea>

    <b-button variant="primary" size="lg" @click="addNew">Save</b-button>
  </b-container>
</template>

<script>
import { mapActions } from "vuex";
import router from "@/router";

export default {
  name: "EditMessage",
  props: {
    naziv: {
      type: String,
      default: "",
    },
    tracer: {
      type: String,
      default: "",
    },
    opis: {
      type: String,
      default: "",
    },
  },
  data() {
    return {
      newNaziv: "",
      newTracer: "",
      newOpis: "",
    };
  },
  
  methods: {
    ...mapActions(["new_currency", "change_currency"]),

    addNew: function () {
      const msg = JSON.stringify({
        naziv: this.newNaziv,
        tracer: this.newTracer,
        opis: this.newOpis,
      });

      if (!this.$route.params.id) this.new_currency(msg);
      else this.change_currency({ id: this.$route.params.id, msg: msg });

      this.newNaziv = "";
      this.newTracer = "";
      this.newOpis = "";

      router.push({path: `/`})
    },
  },
  mounted: function () {
    this.newNaziv = this.naziv;
    this.newTracer = this.tracer;
    this.newOpis = this.opis;
  },
};
</script>

<style scoped>
</style>