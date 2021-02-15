import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Message from "@/views/Message";
import NewMessage from "@/views/NewMessage";
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
    name: 'newMessage',
    component: NewMessage
  },
  {
    path: '/message/:id',
    name: 'message',
    component: Message
  },
  {
    path: '/callback',
    name: 'Callback',
    component: Callback
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
