import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    currencies: []
  },

  mutations: {
    set_currencies: function (state, currencies) {
      state.currencies = currencies;
    },

    add_currency: function (state, message) {
      state.currencies.push(message);
    },

    remove_currency: function (state, id) {
      for (let m = 0; m < state.currencies.length; m++) {
        if (state.currencies[m].id === id) {
          state.currencies.splice(m, 1);
          break;
        }
      }
    },

    update_currency: function (state, payload) {
      for (let m = 0; m < state.currencies.length; m++) {
        if (state.currencies[m].id === parseInt(payload.id)) {
          state.currencies[m].naziv = payload.msg.naziv;
          state.currencies[m].tracer = payload.msg.tracer;
          state.currencies[m].opis = payload.msg.opis;
          break;
        }
      }
    }
  },

  actions: {
    load_currencies: function ({ commit }) {
      fetch('http://localhost/api/valute', { method: 'get' }).then((response) => {
        if (!response.ok)
          throw response;

        return response.json()
      }).then((jsonData) => {
        commit('set_currencies', jsonData)
      }).catch((error) => {
        if (typeof error.text === 'function')
          error.text().then((errorMessage) => {
            alert(errorMessage);
          });
        else
          alert(error);
      });
    },

    delete_currency: function({ commit }, id) {
      fetch(`http://localhost/api/valuta/${id}`, { method: 'delete' }).then((response) => {
        if (!response.ok)
          throw response;

        return response.json()
      }).then((jsonData) => {
        commit('remove_currency', jsonData.id)
      }).catch((error) => {
        if (typeof error.text === 'function')
          error.text().then((errorMessage) => {
            alert(errorMessage);
          });
        else
          alert(error);
      });
    },

    new_currency: function({ commit }, message) {
      fetch('http://localhost/api/valute', {
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
        commit('add_currency', jsonData);
      }).catch((error) => {
        if (typeof error.text === 'function')
          error.text().then((errorMessage) => {
            alert(errorMessage);
          });
        else
          alert(error);
      });
    },

    change_currency: function({ commit }, payload) {
      fetch(`http://localhost/api/valuta/${payload.id}`, {
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
        commit('update_currency', {id: payload.id, msg:jsonData});
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
