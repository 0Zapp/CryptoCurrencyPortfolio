<template>
  <b-container fluid>
    <label for="name">name:</label>
    <b-input
      v-model="newName"
      class="mb-2 mr-sm-2 mb-sm-0"
      placeholder="Bitcoin,Etherium,Dogecoin..."
    ></b-input>
    <label for="description">Description:</label>
    <b-form-textarea
      v-model="newDescription"
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
    name: {
      type: String,
      default: "",
    },
    description: {
      type: String,
      default: "",
    },
  },
  data() {
    return {
      newName: "",
      newDescription: "",
    };
  },
  
  methods: {
    ...mapActions(["new_currency", "change_currency"]),

    addNew: function () {
      const msg = JSON.stringify({
        name: this.newName,
        description: this.newDescription,
      });

      if (!this.$route.params.id) this.new_currency(msg);
      else this.change_currency({ id: this.$route.params.id, msg: msg });

      this.newName = "";
      this.newDescription = "";

      router.push({path: `/`})
    },
  },
  mounted: function () {
    this.newName = this.name;
    this.newDescription = this.description;
  },
};
</script>

<style scoped>
</style>