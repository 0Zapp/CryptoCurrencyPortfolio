import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Currency from "@/views/Currency";
import NewCurrency from "@/views/NewCurrency";
import NewTransaction from "@/views/NewTransaction";
import Callback from "@/components/Callback.vue";

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: Home
  },
  {
    path: '/edit',
    name: 'newCurrency',
    component: NewCurrency
  },
  {
    path: '/currency/:id',
    name: 'currency',
    component: Currency
  },
  {
    path: '/callback',
    name: 'Callback',
    component: Callback
  },
  {
    path: '/transaction/:id',
    name: 'newTransaction',
    component: NewTransaction
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
