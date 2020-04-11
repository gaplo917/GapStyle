<template>
    <div id="app">
        <div id="a" v-if="(1 + '1' === 2) === true"></div>
        <div id="b" v-else-if="(1 + '1' === 2) === true"></div>
        <div id="c" v-else></div>
        <div id="d" v-show="true"></div>
        <ul id="f">
            <li v-for="item in items" :key="item.message">
                {{ item.message }}
            </li>
        </ul>
        <a class="menu-toggle-btn ripple" @click="toggle()">
            <slot name="icon"></slot>
        </a>
    </div>
</template>

<script>
    import * as types from './store/mutation-types'
    import { Notification } from 'notification'
    import { FindInPage } from 'electron-find'

    let findInPage = null
    export default {
        name: 'app',
        async created() {
            const enums = await this.$apiService.enums()

            this.$store.commit(types.ENUMS, enums, {root: true})
        },
        mounted(){

            const ipcRenderer = this.$electron.ipcRenderer;

            if(findInPage === null) {
              findInPage = new FindInPage(this.$electron.remote.getCurrentWebContents(), {
                preload: true,
                parentElement: document.getElementsByClassName('main')[0],
                duration: 50,
                boxShadowColor: 'transparent',
                inputFocusColor: '#409EFF',
                inputBgColor: '#fff'
              })

              findInPage.openFindWindow()
            }

            ipcRenderer.on('download-pdf', (event, {result, filePath}) => {
                if (result) {
                    Notification({
                        title: 'some title',
                        message: ` ${filePath}`,
                        type: 'success',
                        duration: 2000
                    })
                }
                else {
                    Notification({
                        title: 'fail',
                        message: `can't save ${filePath}, please try again`,
                        type: 'alert',
                        duration: 2000
                    })
                }
            })
        },

        data() {
            return {
                items: [1 ,2, 3],
            }
        },

        methods: {
            toggle() {
                this.item.push(this.item.length + 1)
            }
        },
    }
</script>

<style lang="scss" src="./app.scss"></style>
