<template>
  <div>
    <v-simple-table>
      <template v-slot:default>
        <tr>
          <td>아이디</td>
          <td>{{ userInfo }}</td>
        </tr>
        <tr>
          <td>비밀번호</td>
          <td><input type="text" v-model="myPw" /></td>
        </tr>
        <tr>
          <td>이메일</td>
          <td><input type="text" v-model="myEmail" /></td>
        </tr>
        <tr>
          <td>관심지역</td>
          <td><input type="text" v-model="myDong" /></td>
        </tr>
      </template>
    </v-simple-table>

    <v-btn color="#eceff1" @click="modifyMyData"> >수정완료 </v-btn>
  </div>
</template>

<script>
import { mapState, mapActions } from "vuex";
import http from "@/util/http-common.js";
import router from "@/router";

const memberStore = "memberStore";

export default {
  name: "MemberMyPage",
  components: {},
  data: function () {
    return {
      myPw: "",
      myEmail: "",
      myDong: "",
    };
  },
  computed: {
    ...mapState(memberStore, ["userInfo"]),
  },
  created() {
    console.log(this.userInfo);

    http.get("/member/" + this.userInfo).then(({ data }) => {
      console.log(data);
      this.myEmail = data.Member.user_email;
      this.myDong = data.Member.my_dong_code;
    });
  },
  methods: {
    ...mapActions(memberStore, ["getLogout"]),
    async modifyMyData() {
      let user_id = this.userInfo;
      let user_pw = this.myPw;
      let user_email = this.myEmail;
      //   let my_dong_code = this.myDong;
      this.deleteMyData();
      console.log(user_id);
      await http
        .post("/join", {
          user_id: user_id,
          user_pw: user_pw,
          user_email: user_email,
          //   my_dong_code: my_dong_code,
        })
        .then(({ data }) => {
          console.log(data);
        });

      alert("수정완료. 다시 로그인 하시오");
      router.push({ name: "home" });
    },
    deleteMyData() {
      http.delete("/member/" + this.userInfo).then(({ data }) => {
        console.log(data);
        this.getLogout();
        alert("체크");
      });
    },
  },
};
</script>

<style></style>
