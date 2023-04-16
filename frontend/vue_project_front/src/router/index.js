import Vue from "vue";
import VueRouter from "vue-router";
import HomeView from "../views/HomeView.vue";
import QnaView from "@/views/QnaView.vue";
import BootaView from "@/views/BootaView.vue";
import QnaList from "@/components/qna/QnaList.vue";
import QnaDetail from "@/components/qna/QnaDetail.vue";
import QnaModify from "@/components/qna/QnaModify.vue";
import QnaWrite from "@/components/qna/QnaWrite.vue";
import QnaDelete from "@/components/qna/QnaDelete.vue";
import QnaCommentWrite from "@/components/qna/CommentWrite.vue";

import BootaBoardDetail from "@/components/boota/BootaBoardDetail.vue";
import BootaModify from "@/components/boota/BootaModify.vue";
import BootaDelete from "@/components/boota/BootaDelete.vue";
import BootaCommentWrite from "@/components/boota/BootaCommentWrite.vue";

import MemberLoginView from "@/components/user/MemberLogin.vue";
import MemberJoinView from "@/components/user/MemberJoinView.vue";

import MemberPageView from "@/components/user/MemberPageView.vue";
import MemberModify from "@/components/user/MemberModify.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView,
  },
  {
    path: "/qna",
    name: "qna",
    component: QnaView,
    redirect: "/qna/list",
    children: [
      {
        path: "list",
        name: "list",
        component: QnaList,
      },
      {
        path: "write",
        name: "write",
        component: QnaWrite,
      },
      {
        path: "detail/:bno",
        name: "detail",
        component: QnaDetail,
      },
      {
        path: "modify/:bno",
        name: "modify",
        component: QnaModify,
      },
      {
        path: "delete/:bno",
        name: "delete",
        component: QnaDelete,
      },

      {
        path: "commentWrite/:bno",
        name: "commentWrite",
        component: QnaCommentWrite,
      },
    ],
  },
  {
    path: "/house",
    name: "house",
    component: () => import("@/views/HouseView.vue"),
  },
  {
    path: "/login",
    name: "login",
    component: MemberLoginView,
  },
  {
    path: "/join",
    name: "join",
    component: MemberJoinView,
  },
  {
    path: "/mypage",
    name: "mypage",
    component: MemberPageView,
  },
  {
    path: "/modify",
    name: "modify",
    component: MemberModify,
  },
  {
    path: "/boota",
    name: "boota",
    component: BootaView,
  },
  {
    path: "/boota/detail/:btbno",
    name: "detail",
    component: BootaBoardDetail,
  },
  {
    path: "/boota/modify/:btbno",
    name: "modify",
    component: BootaModify,
  },
  {
    path: "/boota/delete/:btbno",
    name: "delete",
    component: BootaDelete,
  },
  {
    path: "/boota/commentWrite/:btbno",
    name: "commentWrite",
    component: BootaCommentWrite,
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
