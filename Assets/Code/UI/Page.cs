using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

namespace TheMazeWhisperer.UI
{
    public class Page : UIBehaviour
    {
        public PageControllerBase Controller { get; private set; }

        protected virtual void OnPageActivated() { }
        protected virtual void OnPageDeactivated() { }

        public void ActivatePage()
        {
            Controller.SetActivePage(this);
        }

        public abstract class PageControllerBase : UIBehaviour
        {
            private Page activePage;

            protected override void Start()
            {
                updatePageStates();
            }

            protected override void OnEnable()
            {
                updatePageStates();
            }

            public void AddPage(Page page)
            {
                if(getPages().Contains(page))
                    return;

                page.transform.SetParent(transform);

                page.Controller = this;

                updatePageStates();
            }

            public Page FindPage<T>() where T : Page
            {
                foreach(Page page in getPages())
                {
                    if(page is T)
                        return page;
                }

                return null;
            }

            public void SetActivePage(Page page)
            {
                setActivePage(page, true);
            }

            private void setActivePage(Page page, bool update = false)
            {
                Page previous = activePage;
                activePage = page;

                if(previous != null)
                {
                    previous.OnPageDeactivated();
                    previous.gameObject.SetActive(false);
                }

                activePage.gameObject.SetActive(true);
                activePage.OnPageActivated();

                if(update)
                {
                    updatePageStates();
                }
            }

            private List<Page> getPages()
            {
                List<Page> pages = new List<Page>();

                for(int index = 0; index < transform.childCount; index++)
                {
                    Page page = transform.GetChild(index).GetComponent<Page>();

                    if(page != null)
                    {
                        pages.Add(page);
                    }
                }

                return pages;
            }

            private void updatePageStates()
            {
                List<Page> pages = getPages();

                if(activePage == null)
                {
                    setActivePage(pages[0]);
                }

                foreach(Page page in pages)
                {
                    page.Controller = this;

                    if(page != activePage)
                    {
                        page.gameObject.SetActive(false);
                    }
                }
            }
        }
    }
}