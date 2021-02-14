<template>
  <div class="home">
      <Header/>
      <b-container>
          <b-row>
              <b-col cm="6" >
                  <MessageList/>
              </b-col>
          </b-row>
      </b-container>
  </div>
</template>

<script>
// @ is an alias to /src
import Header from "@/components/Header";
import MessageList from "@/components/MessageList";

export default {
    name: 'home',
    components: {
        Header,
        MessageList
    }
}
</script>
