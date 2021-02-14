import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    messages: []
  },

  mutations: {
    set_messages: function (state, messages) {
      state.messages = messages;
    },

    add_message: function (state, message) {
      state.messages.push(message);
    },

    remove_message: function (state, id) {
      for (let m = 0; m < state.messages.length; m++) {
        if (state.messages[m].id === id) {
          state.messages.splice(m, 1);
          break;
        }
      }
    },

    update_message: function (state, payload) {
      for (let m = 0; m < state.messages.length; m++) {
        if (state.messages[m].id === parseInt(payload.id)) {
          state.messages[m].user = payload.msg.user;
          state.messages[m].message = payload.msg.message;
          break;
        }
      }
    }
  },

  actions: {
    load_messages: function ({ commit }) {
      fetch('http://localhost/api/poruke', { method: 'get' }).then((response) => {
        if (!response.ok)
          throw response;

        return response.json()
      }).then((jsonData) => {
        commit('set_messages', jsonData)
      }).catch((error) => {
        if (typeof error.text === 'function')
          error.text().then((errorMessage) => {
            alert(errorMessage);
          });
        else
          alert(error);
      });
    },

    delete_message: function({ commit }, id) {
      fetch(`http://localhost/api/poruka/${id}`, { method: 'delete' }).then((response) => {
        if (!response.ok)
          throw response;

        return response.json()
      }).then((jsonData) => {
        commit('remove_message', jsonData.id)
      }).catch((error) => {
        if (typeof error.text === 'function')
          error.text().then((errorMessage) => {
            alert(errorMessage);
          });
        else
          alert(error);
      });
    },

    new_message: function({ commit }, message) {
      fetch('http://localhost/api/poruke', {
        method: 'post',
        headers: {
          'Content-Type': 'application/json'
        },
        body: message
      }).then((response) => {
        if (!response.ok)
          throw response;

        return response.json();
      }).then((jsonData) => {
        commit('add_message', jsonData);
      }).catch((error) => {
        if (typeof error.text === 'function')
          error.text().then((errorMessage) => {
            alert(errorMessage);
          });
        else
          alert(error);
      });
    },

    change_message: function({ commit }, payload) {
      fetch(`http://localhost/api/poruka/${payload.id}`, {
        method: 'put',
        headers: {
          'Content-Type': 'application/json'
        },
        body: payload.msg
      }).then((response) => {
        if (!response.ok)
          throw response;

        return response.json();
      }).then((jsonData) => {
        commit('update_message', {id: payload.id, msg:jsonData});
      }).catch((error) => {
        if (typeof error.text === 'function')
          error.text().then((errorMessage) => {
            alert(errorMessage);
          });
        else
          alert(error);
      });
    }
  }
})
