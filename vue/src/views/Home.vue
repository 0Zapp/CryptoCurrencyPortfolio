<template>
  <div class="home">
    <CurrencyList />
  </div>
</template>

<script>
// @ is an alias to /src
import CurrencyList from "@/components/CurrencyList";

export default {
  name: "home",
  components: {
    CurrencyList,
  },
};
</script>
