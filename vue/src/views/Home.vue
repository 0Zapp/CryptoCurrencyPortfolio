<template>
  <div class="home">
      <b-container>
          <b-row>
              <b-col cm="6" >
                  <CurrencyList/>
              </b-col>
          </b-row>
      </b-container>
  </div>
</template>

<script>
// @ is an alias to /src
import CurrencyList from "@/components/CurrencyList";

export default {
    name: 'home',
    components: {
        CurrencyList
    }
}
</script>
