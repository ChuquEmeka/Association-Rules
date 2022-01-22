{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "1f761f32",
   "metadata": {
    "id": "C2RfesLyrJmR",
    "papermill": {
     "duration": 0.049341,
     "end_time": "2022-01-22T16:14:54.080642",
     "exception": false,
     "start_time": "2022-01-22T16:14:54.031301",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "b53b6d77",
   "metadata": {
    "id": "kkO0WE94rOid",
    "papermill": {
     "duration": 0.043973,
     "end_time": "2022-01-22T16:14:54.169412",
     "exception": false,
     "start_time": "2022-01-22T16:14:54.125439",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Identifying Frequently Purchased GroceriesWith Association Rule- Unsuppervised Learning\n",
    "\n",
    "# Edeh Emeka N.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "1e65c2cb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-22T16:14:54.268019Z",
     "iopub.status.busy": "2022-01-22T16:14:54.264342Z",
     "iopub.status.idle": "2022-01-22T16:14:54.463500Z",
     "shell.execute_reply": "2022-01-22T16:14:54.462656Z"
    },
    "id": "08bX-3i8lEWV",
    "outputId": "be4c2390-a5e0-4bbe-dd14-92a4ee6e134e",
    "papermill": {
     "duration": 0.248435,
     "end_time": "2022-01-22T16:14:54.463659",
     "exception": false,
     "start_time": "2022-01-22T16:14:54.215224",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>V1</th><th scope=col>V2</th><th scope=col>V3</th><th scope=col>V4</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>citrus fruit    </td><td>semi-finished bread</td><td>margarine     </td><td>ready soups             </td></tr>\n",
       "\t<tr><th scope=row>2</th><td>tropical fruit  </td><td>yogurt             </td><td>coffee        </td><td>                        </td></tr>\n",
       "\t<tr><th scope=row>3</th><td>whole milk      </td><td>                   </td><td>              </td><td>                        </td></tr>\n",
       "\t<tr><th scope=row>4</th><td>pip fruit       </td><td>yogurt             </td><td>cream cheese  </td><td>meat spreads            </td></tr>\n",
       "\t<tr><th scope=row>5</th><td>other vegetables</td><td>whole milk         </td><td>condensed milk</td><td>long life bakery product</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>whole milk      </td><td>butter             </td><td>yogurt        </td><td>rice                    </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 4\n",
       "\\begin{tabular}{r|llll}\n",
       "  & V1 & V2 & V3 & V4\\\\\n",
       "  & <chr> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & citrus fruit     & semi-finished bread & margarine      & ready soups             \\\\\n",
       "\t2 & tropical fruit   & yogurt              & coffee         &                         \\\\\n",
       "\t3 & whole milk       &                     &                &                         \\\\\n",
       "\t4 & pip fruit        & yogurt              & cream cheese   & meat spreads            \\\\\n",
       "\t5 & other vegetables & whole milk          & condensed milk & long life bakery product\\\\\n",
       "\t6 & whole milk       & butter              & yogurt         & rice                    \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 4\n",
       "\n",
       "| <!--/--> | V1 &lt;chr&gt; | V2 &lt;chr&gt; | V3 &lt;chr&gt; | V4 &lt;chr&gt; |\n",
       "|---|---|---|---|---|\n",
       "| 1 | citrus fruit     | semi-finished bread | margarine      | ready soups              |\n",
       "| 2 | tropical fruit   | yogurt              | coffee         | <!----> |\n",
       "| 3 | whole milk       | <!----> | <!----> | <!----> |\n",
       "| 4 | pip fruit        | yogurt              | cream cheese   | meat spreads             |\n",
       "| 5 | other vegetables | whole milk          | condensed milk | long life bakery product |\n",
       "| 6 | whole milk       | butter              | yogurt         | rice                     |\n",
       "\n"
      ],
      "text/plain": [
       "  V1               V2                  V3             V4                      \n",
       "1 citrus fruit     semi-finished bread margarine      ready soups             \n",
       "2 tropical fruit   yogurt              coffee                                 \n",
       "3 whole milk                                                                  \n",
       "4 pip fruit        yogurt              cream cheese   meat spreads            \n",
       "5 other vegetables whole milk          condensed milk long life bakery product\n",
       "6 whole milk       butter              yogurt         rice                    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "groc <- read.csv(\"../input/market-basket-analysis/market basket analysis.csv\", header = FALSE)\n",
    "head(groc)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "aec0152f",
   "metadata": {
    "id": "W9FwCY2gsgCh",
    "papermill": {
     "duration": 0.045941,
     "end_time": "2022-01-22T16:14:54.556873",
     "exception": false,
     "start_time": "2022-01-22T16:14:54.510932",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "In order to create the sparse matrix data structure from the transaction data, i have to use the functionality provided by the **arules** package"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "cb234292",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-22T16:14:54.696954Z",
     "iopub.status.busy": "2022-01-22T16:14:54.654710Z",
     "iopub.status.idle": "2022-01-22T16:15:28.223678Z",
     "shell.execute_reply": "2022-01-22T16:15:28.220681Z"
    },
    "id": "uMk_x9dLtF2R",
    "outputId": "410605f6-c917-415f-ee9d-61c397566f05",
    "papermill": {
     "duration": 33.619955,
     "end_time": "2022-01-22T16:15:28.224094",
     "exception": false,
     "start_time": "2022-01-22T16:14:54.604139",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n"
     ]
    }
   ],
   "source": [
    "install.packages(\"arules\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "07386f33",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-22T16:15:28.327442Z",
     "iopub.status.busy": "2022-01-22T16:15:28.325644Z",
     "iopub.status.idle": "2022-01-22T16:15:29.991452Z",
     "shell.execute_reply": "2022-01-22T16:15:29.989855Z"
    },
    "id": "FyAOr8O8tWO5",
    "outputId": "e614d76e-c215-4f29-cec8-0f366ab403d8",
    "papermill": {
     "duration": 1.717028,
     "end_time": "2022-01-22T16:15:29.991626",
     "exception": false,
     "start_time": "2022-01-22T16:15:28.274598",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: Matrix\n",
      "\n",
      "\n",
      "Attaching package: ‘arules’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    abbreviate, write\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(\"arules\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "f9f65ccd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-22T16:15:30.101469Z",
     "iopub.status.busy": "2022-01-22T16:15:30.099847Z",
     "iopub.status.idle": "2022-01-22T16:15:31.415761Z",
     "shell.execute_reply": "2022-01-22T16:15:31.414262Z"
    },
    "id": "KlYPDOX8tr0O",
    "outputId": "d22565bc-c0ca-4516-9f8a-5864a83634c1",
    "papermill": {
     "duration": 1.373997,
     "end_time": "2022-01-22T16:15:31.415905",
     "exception": false,
     "start_time": "2022-01-22T16:15:30.041908",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "transactions in sparse format with\n",
       " 9835 transactions (rows) and\n",
       " 169 items (columns)"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "groceries<-read.transactions(\"../input/market-basket-analysis/market basket analysis.csv\", sep = \",\")\n",
    "groceries"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "2bd87407",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-22T16:15:31.523447Z",
     "iopub.status.busy": "2022-01-22T16:15:31.521505Z",
     "iopub.status.idle": "2022-01-22T16:15:31.560216Z",
     "shell.execute_reply": "2022-01-22T16:15:31.558693Z"
    },
    "id": "t3mpZyTfuKwY",
    "outputId": "efa40cec-afb3-4fa4-a164-1f881fc40739",
    "papermill": {
     "duration": 0.094491,
     "end_time": "2022-01-22T16:15:31.560378",
     "exception": false,
     "start_time": "2022-01-22T16:15:31.465887",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "transactions as itemMatrix in sparse format with\n",
       " 9835 rows (elements/itemsets/transactions) and\n",
       " 169 columns (items) and a density of 0.02609146 \n",
       "\n",
       "most frequent items:\n",
       "      whole milk other vegetables       rolls/buns             soda \n",
       "            2513             1903             1809             1715 \n",
       "          yogurt          (Other) \n",
       "            1372            34055 \n",
       "\n",
       "element (itemset/transaction) length distribution:\n",
       "sizes\n",
       "   1    2    3    4    5    6    7    8    9   10   11   12   13   14   15   16 \n",
       "2159 1643 1299 1005  855  645  545  438  350  246  182  117   78   77   55   46 \n",
       "  17   18   19   20   21   22   23   24   26   27   28   29   32 \n",
       "  29   14   14    9   11    4    6    1    1    1    1    3    1 \n",
       "\n",
       "   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n",
       "  1.000   2.000   3.000   4.409   6.000  32.000 \n",
       "\n",
       "includes extended item information - examples:\n",
       "            labels\n",
       "1 abrasive cleaner\n",
       "2 artif. sweetener\n",
       "3   baby cosmetics"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(groceries) #to view some basic informations about the transaction matrix"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "caff946a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-22T16:15:31.667400Z",
     "iopub.status.busy": "2022-01-22T16:15:31.665459Z",
     "iopub.status.idle": "2022-01-22T16:15:31.698448Z",
     "shell.execute_reply": "2022-01-22T16:15:31.696698Z"
    },
    "id": "8oWNf2_DutMg",
    "outputId": "97f119d1-ed96-4b9a-9154-d1da14a62cd2",
    "papermill": {
     "duration": 0.087718,
     "end_time": "2022-01-22T16:15:31.698624",
     "exception": false,
     "start_time": "2022-01-22T16:15:31.610906",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "    items                      \n",
      "[1] {citrus fruit,             \n",
      "     margarine,                \n",
      "     ready soups,              \n",
      "     semi-finished bread}      \n",
      "[2] {coffee,                   \n",
      "     tropical fruit,           \n",
      "     yogurt}                   \n",
      "[3] {whole milk}               \n",
      "[4] {cream cheese,             \n",
      "     meat spreads,             \n",
      "     pip fruit,                \n",
      "     yogurt}                   \n",
      "[5] {condensed milk,           \n",
      "     long life bakery product, \n",
      "     other vegetables,         \n",
      "     whole milk}               \n",
      "[6] {abrasive cleaner,         \n",
      "     butter,                   \n",
      "     rice,                     \n",
      "     whole milk,               \n",
      "     yogurt}                   \n"
     ]
    }
   ],
   "source": [
    "inspect(groceries[1:6]) #for the first 6 transactions"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "46af3e6b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-22T16:15:31.812781Z",
     "iopub.status.busy": "2022-01-22T16:15:31.811024Z",
     "iopub.status.idle": "2022-01-22T16:15:31.845328Z",
     "shell.execute_reply": "2022-01-22T16:15:31.843765Z"
    },
    "id": "TJnba7eDyMYH",
    "outputId": "83a37b84-c024-42d1-ff78-0811d58a7a68",
    "papermill": {
     "duration": 0.093713,
     "end_time": "2022-01-22T16:15:31.845489",
     "exception": false,
     "start_time": "2022-01-22T16:15:31.751776",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<strong>artif. sweetener:</strong> 0"
      ],
      "text/latex": [
       "\\textbf{artif. sweetener:} 0"
      ],
      "text/markdown": [
       "**artif. sweetener:** 0"
      ],
      "text/plain": [
       "artif. sweetener \n",
       "               0 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "itemFrequency(groceries[4,2])"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6e6ce748",
   "metadata": {
    "id": "iowKwGGEBsxv",
    "papermill": {
     "duration": 0.053067,
     "end_time": "2022-01-22T16:15:31.951906",
     "exception": false,
     "start_time": "2022-01-22T16:15:31.898839",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "####*Visualizing* item support below"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "9b244f0e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-22T16:15:32.065135Z",
     "iopub.status.busy": "2022-01-22T16:15:32.063366Z",
     "iopub.status.idle": "2022-01-22T16:15:32.317347Z",
     "shell.execute_reply": "2022-01-22T16:15:32.316024Z"
    },
    "id": "gm5ZaIcPAqg4",
    "outputId": "80f6f6dc-d167-4d3f-f1e6-1ed67d9cdc51",
    "papermill": {
     "duration": 0.312958,
     "end_time": "2022-01-22T16:15:32.317515",
     "exception": false,
     "start_time": "2022-01-22T16:15:32.004557",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "itemFrequencyPlot(groceries, support=0.1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "d23beb76",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-22T16:15:32.439990Z",
     "iopub.status.busy": "2022-01-22T16:15:32.438322Z",
     "iopub.status.idle": "2022-01-22T16:15:32.621366Z",
     "shell.execute_reply": "2022-01-22T16:15:32.619325Z"
    },
    "id": "aF-BByEkCNHi",
    "outputId": "f6b34e63-b42e-4802-8699-15051ad0745c",
    "papermill": {
     "duration": 0.246363,
     "end_time": "2022-01-22T16:15:32.621532",
     "exception": false,
     "start_time": "2022-01-22T16:15:32.375169",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "transactions in sparse format with\n",
       " 9835 transactions (rows) and\n",
       " 169 items (columns)"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nO3dZ5xU5cHw4Xu279I7oogKCNJElKqoCCqgiCU+ViyPxpgnxIgd9TUq1hjBrrEH\nEzX2BsaKiA0FO2JXBFSqNFkWdnfeD6srwroie4Dl5ro+5LdzZubc90yO498z55xJpdPpAADA\nxi9jQ08AAIBkCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEhkJb7GkqIls76dNWvW/Ny6DZs2bVq/\ndn7iQwAAsLqkwq70nWfuf2js088999yr739Vmk6X31FzszZ79O3br9/ehx62b6McOwgBANaV\nVHqlCFsL6ZLFj9x85VVXX/viR/Oz8upv3617lw6tGzZo0KB+nRVLvps3b97XX3w48bXXPpu1\n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\nVCN2TGogAAAqlNhZseVWpEP2j7/5u/CDlz/NbLVjmybJDgEAwOqSDzsAADaIxL6KTZcsufn0\n/2m/VaP8X5DUQAAAVCgrqRW9dFrvP1z1dmZu4y7detbJzUxqtQAArKHEvortVSdvcul2L3/+\n6k6N8hJZIQAAv0kyX8WmSwvfWLy8xeBrVB0AwIaSUNiVfJ8OIV1amsjaAABYC8mEXUZ2wwu7\nNf7qsZPeX7IikRUCAPBbJXaMXfHSqcf36/vA9JbnXXDSzp22a1pv1dNgW7ZsmchAAABUKLGw\nS6VSlT/ABfMAANapxC53MnTo0KRWBQDAWvDLEwAAkUjslycq8eFNe9Rv0nU9DASsf81yszKz\n62/oWayp1y/u3az3tassnPn6w38+av/tWjSrlZ9dUKte2x13O+mim79Z/ttO8392QItUKvXq\n4uXJTTZJJctndqhV46aPF2zoiQDrVpJ77KY9c+d1D4/7cs7Sny8unfLUEx8X1S0umpXUQED1\n0Sw3a1Zp7ZIV88tuLpp2bovO1/e8YdLYw6rd+VKFs59otsVBN0ybf9hmNcoX3nfufode8kQI\noXmHrm2b118488uPp37y3fKSmlvs8cx7Y3vUzV3DlT87oMWe//3qlUVFPWvlrJPZV9kH1/fr\ncXnjb7/8d0HGrxwSDWy8EjvG7utxZ7Xp/7ei0goyMbtm0/1PH53UQEB1li5dtmDBgiW/cXfX\n+nHTfsfn7XT9ylX3zg2/O+Tix+u0Gvyvh27Zt2OjsoXFS2def+p+J9/0/KA9zp/z5qUbaLLJ\n2+4PD2x5ZuMD7zz/v/+77YaeC7CuJPZV7M3H3bQis97oiZ8uXTznnI4NNu9z77JlyxbP+fLK\no9rlN+7zj/P7JjUQELFlS5eto8N+l86+57TXZ+9/zX7lS1YseXOPkx/Oqdn55bcfKK+6EEJW\nweZ/ueHVYzerOfety66esWTdTOdn1uJVlxb95nZOZdW96chWL5x6wgpHVkO8Egu7O775vn6b\nK4d0a5lfs+ExZ7af986dubm5NRu2GHb7a13nPzzo8veSGgiotm5sXb/uNleGECYcs20qlbr+\nm+/LlqdLFv770pN6tWtROz+3cfNWex556tMfLix/1ouHtU6lUku+Grtf5y3za+Rn59ZsudPe\nt778bShddveIEzpu2SQvO7fJNtsPu+bZlceacNclA3p0qFcrPye/Zqvtew+/bkzluTL5nAsz\n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\nazTxs4MAANVClU6eAACg+vBVLABAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQd\nAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSE\nHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAk\nhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBA\nJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0A\nQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQd\nAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSE\nHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAk\nhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBA\nJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0A\nQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQd\nAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSE\nHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAk\nhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBA\nJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0A\nQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQd\nAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSE\nHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAk\nhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBA\nJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0A\nQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQd\nAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSE\nHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAk\nhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBA\nJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0A\nQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQd\nAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSE\nHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAk\nhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBA\nJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0A\nQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQd\nAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSE\nHQBAJIQdAEAk/j8zCLjzhScfngAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "image(groceries[1:6])\n",
    "sample(groceries)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f2787ae1",
   "metadata": {
    "id": "1570jtssDfp-",
    "papermill": {
     "duration": 0.058376,
     "end_time": "2022-01-22T16:15:32.738569",
     "exception": false,
     "start_time": "2022-01-22T16:15:32.680193",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Creating A Model to find association between shopping  \n",
    "cart items.\n",
    "I am going to use the Apriori Algorithm in the Arules   \n",
    "for this model**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "9bc2cd5f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-22T16:15:32.862542Z",
     "iopub.status.busy": "2022-01-22T16:15:32.860893Z",
     "iopub.status.idle": "2022-01-22T16:15:32.932156Z",
     "shell.execute_reply": "2022-01-22T16:15:32.930813Z"
    },
    "id": "wH2-v0A1EJsx",
    "outputId": "1efa8ec6-5780-4c0b-e140-c5d18ee25485",
    "papermill": {
     "duration": 0.136161,
     "end_time": "2022-01-22T16:15:32.932354",
     "exception": false,
     "start_time": "2022-01-22T16:15:32.796193",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Apriori\n",
      "\n",
      "Parameter specification:\n",
      " confidence minval smax arem  aval originalSupport maxtime support minlen\n",
      "       0.25    0.1    1 none FALSE            TRUE       5   0.006      2\n",
      " maxlen target  ext\n",
      "     10  rules TRUE\n",
      "\n",
      "Algorithmic control:\n",
      " filter tree heap memopt load sort verbose\n",
      "    0.1 TRUE TRUE  FALSE TRUE    2    TRUE\n",
      "\n",
      "Absolute minimum support count: 59 \n",
      "\n",
      "set item appearances ...[0 item(s)] done [0.00s].\n",
      "set transactions ...[169 item(s), 9835 transaction(s)] done [0.00s].\n",
      "sorting and recoding items ... [109 item(s)] done [0.00s].\n",
      "creating transaction tree ... done [0.00s].\n",
      "checking subsets of size 1 2 3 4 done [0.00s].\n",
      "writing ... [463 rule(s)] done [0.00s].\n",
      "creating S4 object  ... done [0.00s].\n"
     ]
    }
   ],
   "source": [
    "grocrule<-apriori(data = groceries, parameter = list(support = 0.006, confidence\n",
    "=0.25, minlen=2))\n",
    "#minlen is set to 2 to eliminate the rules that contain fewer than 2 items\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "2ee6d0a8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-22T16:15:33.055814Z",
     "iopub.status.busy": "2022-01-22T16:15:33.054174Z",
     "iopub.status.idle": "2022-01-22T16:15:33.083243Z",
     "shell.execute_reply": "2022-01-22T16:15:33.082187Z"
    },
    "id": "6cHEfaU3GFrF",
    "outputId": "d9d59e8a-5b37-4c1f-d46d-ee9494a98048",
    "papermill": {
     "duration": 0.09249,
     "end_time": "2022-01-22T16:15:33.083400",
     "exception": false,
     "start_time": "2022-01-22T16:15:32.990910",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "    lhs                rhs                support     confidence coverage  \n",
      "[1] {potted plants} => {whole milk}       0.006914082 0.4000000  0.01728521\n",
      "[2] {pasta}         => {whole milk}       0.006100661 0.4054054  0.01504830\n",
      "[3] {herbs}         => {root vegetables}  0.007015760 0.4312500  0.01626843\n",
      "[4] {herbs}         => {other vegetables} 0.007727504 0.4750000  0.01626843\n",
      "    lift     count\n",
      "[1] 1.565460 68   \n",
      "[2] 1.586614 60   \n",
      "[3] 3.956477 69   \n",
      "[4] 2.454874 76   \n"
     ]
    }
   ],
   "source": [
    "inspect(grocrule[1:4])"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "9e027ee4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-22T16:15:33.210522Z",
     "iopub.status.busy": "2022-01-22T16:15:33.208835Z",
     "iopub.status.idle": "2022-01-22T16:15:33.236953Z",
     "shell.execute_reply": "2022-01-22T16:15:33.235178Z"
    },
    "id": "Z8RDrbGzHAwg",
    "outputId": "5dc26003-42c2-45ae-c938-9b45a5a64560",
    "papermill": {
     "duration": 0.093387,
     "end_time": "2022-01-22T16:15:33.237168",
     "exception": false,
     "start_time": "2022-01-22T16:15:33.143781",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "set of 463 rules\n",
       "\n",
       "rule length distribution (lhs + rhs):sizes\n",
       "  2   3   4 \n",
       "150 297  16 \n",
       "\n",
       "   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n",
       "  2.000   2.000   3.000   2.711   3.000   4.000 \n",
       "\n",
       "summary of quality measures:\n",
       "    support           confidence        coverage             lift       \n",
       " Min.   :0.006101   Min.   :0.2500   Min.   :0.009964   Min.   :0.9932  \n",
       " 1st Qu.:0.007117   1st Qu.:0.2971   1st Qu.:0.018709   1st Qu.:1.6229  \n",
       " Median :0.008744   Median :0.3554   Median :0.024809   Median :1.9332  \n",
       " Mean   :0.011539   Mean   :0.3786   Mean   :0.032608   Mean   :2.0351  \n",
       " 3rd Qu.:0.012303   3rd Qu.:0.4495   3rd Qu.:0.035892   3rd Qu.:2.3565  \n",
       " Max.   :0.074835   Max.   :0.6600   Max.   :0.255516   Max.   :3.9565  \n",
       "     count      \n",
       " Min.   : 60.0  \n",
       " 1st Qu.: 70.0  \n",
       " Median : 86.0  \n",
       " Mean   :113.5  \n",
       " 3rd Qu.:121.0  \n",
       " Max.   :736.0  \n",
       "\n",
       "mining info:\n",
       "      data ntransactions support confidence\n",
       " groceries          9835   0.006       0.25\n",
       "                                                                                        call\n",
       " apriori(data = groceries, parameter = list(support = 0.006, confidence = 0.25, minlen = 2))"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(grocrule)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a2ca03a6",
   "metadata": {
    "id": "5Ihz7iUrI4T9",
    "papermill": {
     "duration": 0.060717,
     "end_time": "2022-01-22T16:15:33.359429",
     "exception": false,
     "start_time": "2022-01-22T16:15:33.298712",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**In most cases, depending on the objectives of the market,\n",
    "market basket analysis though, the most useful rules might be the ones with the highest *support*, *confidence* or *lift*. I will now sort the list of rules to reveal the ones with the top ten confidence level.**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "699cbb75",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-22T16:15:33.488225Z",
     "iopub.status.busy": "2022-01-22T16:15:33.486708Z",
     "iopub.status.idle": "2022-01-22T16:15:33.511882Z",
     "shell.execute_reply": "2022-01-22T16:15:33.509801Z"
    },
    "id": "ut476r2PJxxJ",
    "papermill": {
     "duration": 0.091299,
     "end_time": "2022-01-22T16:15:33.512058",
     "exception": false,
     "start_time": "2022-01-22T16:15:33.420759",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "top.support <- sort(grocrule, decreasing = TRUE, na.last = NA, by = \"confidence\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "efa19a1d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-22T16:15:33.646733Z",
     "iopub.status.busy": "2022-01-22T16:15:33.644200Z",
     "iopub.status.idle": "2022-01-22T16:15:33.754791Z",
     "shell.execute_reply": "2022-01-22T16:15:33.753453Z"
    },
    "id": "-tQ2ka2BLtG_",
    "outputId": "edf718f8-0df2-4457-9be3-3ae5c1fde44a",
    "papermill": {
     "duration": 0.178768,
     "end_time": "2022-01-22T16:15:33.754957",
     "exception": false,
     "start_time": "2022-01-22T16:15:33.576189",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "     lhs                     rhs                    support confidence    coverage     lift count\n",
      "[1]  {butter,                                                                                    \n",
      "      whipped/sour cream} => {whole milk}       0.006710727  0.6600000 0.010167768 2.583008    66\n",
      "[2]  {butter,                                                                                    \n",
      "      yogurt}             => {whole milk}       0.009354347  0.6388889 0.014641586 2.500387    92\n",
      "[3]  {butter,                                                                                    \n",
      "      root vegetables}    => {whole milk}       0.008235892  0.6377953 0.012913066 2.496107    81\n",
      "[4]  {curd,                                                                                      \n",
      "      tropical fruit}     => {whole milk}       0.006507372  0.6336634 0.010269446 2.479936    64\n",
      "[5]  {butter,                                                                                    \n",
      "      tropical fruit}     => {whole milk}       0.006202339  0.6224490 0.009964413 2.436047    61\n",
      "[6]  {other vegetables,                                                                          \n",
      "      tropical fruit,                                                                            \n",
      "      yogurt}             => {whole milk}       0.007625826  0.6198347 0.012302999 2.425816    75\n",
      "[7]  {domestic eggs,                                                                             \n",
      "      tropical fruit}     => {whole milk}       0.006914082  0.6071429 0.011387900 2.376144    68\n",
      "[8]  {other vegetables,                                                                          \n",
      "      root vegetables,                                                                           \n",
      "      yogurt}             => {whole milk}       0.007829181  0.6062992 0.012913066 2.372842    77\n",
      "[9]  {domestic eggs,                                                                             \n",
      "      root vegetables}    => {whole milk}       0.008540925  0.5957447 0.014336553 2.331536    84\n",
      "[10] {citrus fruit,                                                                              \n",
      "      root vegetables}    => {other vegetables} 0.010371124  0.5862069 0.017691917 3.029608   102\n"
     ]
    }
   ],
   "source": [
    "inspect(head(top.support, 10))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5b2d9bce",
   "metadata": {
    "id": "15McRNohOm4v",
    "papermill": {
     "duration": 0.060822,
     "end_time": "2022-01-22T16:15:33.876779",
     "exception": false,
     "start_time": "2022-01-22T16:15:33.815957",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Taking subsets of my Association Rule. I will use the   subset function to search for the subsets of transaction,   items or rules. I will search for rules with \"othe vegetables\""
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "ca632886",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-22T16:15:34.008563Z",
     "iopub.status.busy": "2022-01-22T16:15:34.006615Z",
     "iopub.status.idle": "2022-01-22T16:15:34.051606Z",
     "shell.execute_reply": "2022-01-22T16:15:34.049845Z"
    },
    "id": "EThyLik6PlKO",
    "outputId": "9f4daaa9-070f-4f6b-9f29-047427dc7d0a",
    "papermill": {
     "duration": 0.11151,
     "end_time": "2022-01-22T16:15:34.051776",
     "exception": false,
     "start_time": "2022-01-22T16:15:33.940266",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "    lhs                     rhs                support     confidence\n",
      "[1] {herbs}              => {other vegetables} 0.007727504 0.4750000 \n",
      "[2] {detergent}          => {other vegetables} 0.006405694 0.3333333 \n",
      "[3] {pickled vegetables} => {other vegetables} 0.006405694 0.3579545 \n",
      "[4] {baking powder}      => {other vegetables} 0.007320793 0.4137931 \n",
      "[5] {flour}              => {other vegetables} 0.006304016 0.3625731 \n",
      "    coverage   lift     count\n",
      "[1] 0.01626843 2.454874 76   \n",
      "[2] 0.01921708 1.722719 63   \n",
      "[3] 0.01789527 1.849965 63   \n",
      "[4] 0.01769192 2.138547 72   \n",
      "[5] 0.01738688 1.873834 62   \n"
     ]
    }
   ],
   "source": [
    "othe_veg_rule<-subset(grocrule, items %in% \"other vegetables\") \n",
    "inspect(othe_veg_rule[1:5])"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "6dd35ddb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-22T16:15:34.186259Z",
     "iopub.status.busy": "2022-01-22T16:15:34.183996Z",
     "iopub.status.idle": "2022-01-22T16:15:34.215659Z",
     "shell.execute_reply": "2022-01-22T16:15:34.213739Z"
    },
    "id": "5myTDLTUTntg",
    "papermill": {
     "duration": 0.100239,
     "end_time": "2022-01-22T16:15:34.215885",
     "exception": false,
     "start_time": "2022-01-22T16:15:34.115646",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "write(grocrule, file = \"groceryrules.csv\", sep = \",\", quote=TRUE, row.names=FALSE\n",
    ")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "0d3782f8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-22T16:15:34.349198Z",
     "iopub.status.busy": "2022-01-22T16:15:34.347525Z",
     "iopub.status.idle": "2022-01-22T16:15:34.370761Z",
     "shell.execute_reply": "2022-01-22T16:15:34.369150Z"
    },
    "id": "IfYWzvC7UTqP",
    "papermill": {
     "duration": 0.090659,
     "end_time": "2022-01-22T16:15:34.370939",
     "exception": false,
     "start_time": "2022-01-22T16:15:34.280280",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "grocery_df<-as(grocrule, \"data.frame\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "e46e7c58",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-22T16:15:34.504930Z",
     "iopub.status.busy": "2022-01-22T16:15:34.503890Z",
     "iopub.status.idle": "2022-01-22T16:15:34.534838Z",
     "shell.execute_reply": "2022-01-22T16:15:34.532789Z"
    },
    "id": "UQQNvRe8XUCH",
    "outputId": "92a7d8ef-9ded-4521-a0d4-64e3a4762b2f",
    "papermill": {
     "duration": 0.101571,
     "end_time": "2022-01-22T16:15:34.535010",
     "exception": false,
     "start_time": "2022-01-22T16:15:34.433439",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t463 obs. of  6 variables:\n",
      " $ rules     : chr  \"{potted plants} => {whole milk}\" \"{pasta} => {whole milk}\" \"{herbs} => {root vegetables}\" \"{herbs} => {other vegetables}\" ...\n",
      " $ support   : num  0.00691 0.0061 0.00702 0.00773 0.00773 ...\n",
      " $ confidence: num  0.4 0.405 0.431 0.475 0.475 ...\n",
      " $ coverage  : num  0.0173 0.015 0.0163 0.0163 0.0163 ...\n",
      " $ lift      : num  1.57 1.59 3.96 2.45 1.86 ...\n",
      " $ count     : int  68 60 69 76 76 69 70 67 63 88 ...\n"
     ]
    }
   ],
   "source": [
    "str(grocery_df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "9b4f197c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-22T16:15:34.671734Z",
     "iopub.status.busy": "2022-01-22T16:15:34.669159Z",
     "iopub.status.idle": "2022-01-22T16:15:34.702404Z",
     "shell.execute_reply": "2022-01-22T16:15:34.700471Z"
    },
    "id": "3cPSfqAxY4Zp",
    "outputId": "9bec76ca-955a-4340-cd48-fba6d0ab3b22",
    "papermill": {
     "duration": 0.102784,
     "end_time": "2022-01-22T16:15:34.702579",
     "exception": false,
     "start_time": "2022-01-22T16:15:34.599795",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>rules</th><th scope=col>support</th><th scope=col>confidence</th><th scope=col>coverage</th><th scope=col>lift</th><th scope=col>count</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>221</th><td><span style=white-space:pre-wrap>{butter,whipped/sour cream} =&gt; {whole milk}             </span></td><td>0.006710727</td><td>0.6600000</td><td>0.010167768</td><td>2.583008</td><td>66</td></tr>\n",
       "\t<tr><th scope=row>229</th><td><span style=white-space:pre-wrap>{butter,yogurt} =&gt; {whole milk}                         </span></td><td>0.009354347</td><td>0.6388889</td><td>0.014641586</td><td>2.500387</td><td>92</td></tr>\n",
       "\t<tr><th scope=row>225</th><td><span style=white-space:pre-wrap>{butter,root vegetables} =&gt; {whole milk}                </span></td><td>0.008235892</td><td>0.6377953</td><td>0.012913066</td><td>2.496107</td><td>81</td></tr>\n",
       "\t<tr><th scope=row>183</th><td><span style=white-space:pre-wrap>{curd,tropical fruit} =&gt; {whole milk}                   </span></td><td>0.006507372</td><td>0.6336634</td><td>0.010269446</td><td>2.479936</td><td>64</td></tr>\n",
       "\t<tr><th scope=row>222</th><td><span style=white-space:pre-wrap>{butter,tropical fruit} =&gt; {whole milk}                 </span></td><td>0.006202339</td><td>0.6224490</td><td>0.009964413</td><td>2.436047</td><td>61</td></tr>\n",
       "\t<tr><th scope=row>452</th><td>{other vegetables,tropical fruit,yogurt} =&gt; {whole milk}</td><td>0.007625826</td><td>0.6198347</td><td>0.012302999</td><td>2.425816</td><td>75</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 6\n",
       "\\begin{tabular}{r|llllll}\n",
       "  & rules & support & confidence & coverage & lift & count\\\\\n",
       "  & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <int>\\\\\n",
       "\\hline\n",
       "\t221 & \\{butter,whipped/sour cream\\} => \\{whole milk\\}              & 0.006710727 & 0.6600000 & 0.010167768 & 2.583008 & 66\\\\\n",
       "\t229 & \\{butter,yogurt\\} => \\{whole milk\\}                          & 0.009354347 & 0.6388889 & 0.014641586 & 2.500387 & 92\\\\\n",
       "\t225 & \\{butter,root vegetables\\} => \\{whole milk\\}                 & 0.008235892 & 0.6377953 & 0.012913066 & 2.496107 & 81\\\\\n",
       "\t183 & \\{curd,tropical fruit\\} => \\{whole milk\\}                    & 0.006507372 & 0.6336634 & 0.010269446 & 2.479936 & 64\\\\\n",
       "\t222 & \\{butter,tropical fruit\\} => \\{whole milk\\}                  & 0.006202339 & 0.6224490 & 0.009964413 & 2.436047 & 61\\\\\n",
       "\t452 & \\{other vegetables,tropical fruit,yogurt\\} => \\{whole milk\\} & 0.007625826 & 0.6198347 & 0.012302999 & 2.425816 & 75\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 6\n",
       "\n",
       "| <!--/--> | rules &lt;chr&gt; | support &lt;dbl&gt; | confidence &lt;dbl&gt; | coverage &lt;dbl&gt; | lift &lt;dbl&gt; | count &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|\n",
       "| 221 | {butter,whipped/sour cream} =&gt; {whole milk}              | 0.006710727 | 0.6600000 | 0.010167768 | 2.583008 | 66 |\n",
       "| 229 | {butter,yogurt} =&gt; {whole milk}                          | 0.009354347 | 0.6388889 | 0.014641586 | 2.500387 | 92 |\n",
       "| 225 | {butter,root vegetables} =&gt; {whole milk}                 | 0.008235892 | 0.6377953 | 0.012913066 | 2.496107 | 81 |\n",
       "| 183 | {curd,tropical fruit} =&gt; {whole milk}                    | 0.006507372 | 0.6336634 | 0.010269446 | 2.479936 | 64 |\n",
       "| 222 | {butter,tropical fruit} =&gt; {whole milk}                  | 0.006202339 | 0.6224490 | 0.009964413 | 2.436047 | 61 |\n",
       "| 452 | {other vegetables,tropical fruit,yogurt} =&gt; {whole milk} | 0.007625826 | 0.6198347 | 0.012302999 | 2.425816 | 75 |\n",
       "\n"
      ],
      "text/plain": [
       "    rules                                                    support    \n",
       "221 {butter,whipped/sour cream} => {whole milk}              0.006710727\n",
       "229 {butter,yogurt} => {whole milk}                          0.009354347\n",
       "225 {butter,root vegetables} => {whole milk}                 0.008235892\n",
       "183 {curd,tropical fruit} => {whole milk}                    0.006507372\n",
       "222 {butter,tropical fruit} => {whole milk}                  0.006202339\n",
       "452 {other vegetables,tropical fruit,yogurt} => {whole milk} 0.007625826\n",
       "    confidence coverage    lift     count\n",
       "221 0.6600000  0.010167768 2.583008 66   \n",
       "229 0.6388889  0.014641586 2.500387 92   \n",
       "225 0.6377953  0.012913066 2.496107 81   \n",
       "183 0.6336634  0.010269446 2.479936 64   \n",
       "222 0.6224490  0.009964413 2.436047 61   \n",
       "452 0.6198347  0.012302999 2.425816 75   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(grocery_df[order(-grocery_df$confidence),])"
   ]
  }
 ],
 "metadata": {
  "colab": {
   "collapsed_sections": [],
   "name": "Association Rules.ipynb",
   "provenance": []
  },
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 44.253125,
   "end_time": "2022-01-22T16:15:34.881505",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-01-22T16:14:50.628380",
   "version": "2.3.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
