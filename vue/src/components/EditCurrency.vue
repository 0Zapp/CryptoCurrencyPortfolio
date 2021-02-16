<template>
  <b-container fluid>
    <label for="naziv">Naziv:</label>
    <b-input
      v-model="newUser"
      class="mb-2 mr-sm-2 mb-sm-0"
      placeholder="Jane Doe"
    ></b-input>
    <label for="naziv">Tracer:</label>
    <b-input
      v-model="newUser"
      class="mb-2 mr-sm-2 mb-sm-0"
      placeholder="Jane Doe"
    ></b-input>
    <label for="naziv">Opis:</label>
    <b-form-textarea
      v-model="newMessage"
      placeholder="Some message"
    ></b-form-textarea>

    <b-button variant="primary" size="lg" @click="addNew">Save</b-button>
  </b-container>
</template>

<script>
import { mapActions } from "vuex";

export default {
  name: "EditMessage",
  props: {
    user: {
      type: String,
      default: "",
    },
    message: {
      type: String,
      default: "",
    },
  },
  data() {
    return {
      newUser: "",
      newMessage: "",
    };
  },
  mounted: function () {
    this.newUser = this.user;
    this.newMessage = this.message;
  },
  methods: {
    ...mapActions(["new_currency", "change_currency"]),

    addNew: function () {
      const msg = JSON.stringify({
        user: this.newUser,
        message: this.newMessage,
      });

      if (!this.$route.params.id) this.new_currency(msg);
      else this.change_currency({ id: this.$route.params.id, msg: msg });

      this.newUser = "";
      this.newMessage = "";
    },
  },
};
</script>

<style scoped>
</style>